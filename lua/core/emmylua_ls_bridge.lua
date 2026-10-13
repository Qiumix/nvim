--- Lazy library resolution for emmylua_ls.
---
--- emmylua_ls reads `workspace.library` statically and has no glob support, so
--- types (`---@type dap.Configuration`) and `require()`s referring to plugins
--- stay unresolved. This module inspects Lua buffers for plugin references,
--- resolves each one to the plugin directory that owns it, and pushes the
--- accumulated list to the client as `emmylua.workspace.library` -- the only
--- scope emmylua_ls honours for Neovim clients. Plugins are only indexed once
--- a buffer actually references them.
local M = {}

local data_dir = vim.fn.stdpath("data") --[[@as string]]
local pack_lua_glob = vim.fs.joinpath(data_dir, "site", "pack", "*", "*", "*", "lua")

--- Top-level module name -> owning plugin directory (false = not found).
---@type table<string, string|false>
local module_roots = {}

--- Plugin directories discovered across all scanned buffers.
---@type table<string, true>
local discovered = {}

--- client id -> key of the last library list pushed to it.
---@type table<integer, string>
local pushed = {}

--- Buffers with a scan already queued.
---@type table<integer, boolean>
local queued = {}

local require_pattern = [=[require%s*%(?%s*["']([%w_%.%-]+)["']]=]
local module_pattern = [=[%-%-%-@module%s+["']([%w_%.%-]+)["']]=]

--- Resolve a module name to the plugin directory providing it.
---@param mod string
---@return string?
local function plugin_root(mod)
  local top = mod:match("^([^.]+)")
  if not top then
    return nil
  end
  local cached = module_roots[top]
  if cached == nil then
    local hits = vim.fn.glob(pack_lua_glob .. "/" .. top .. ".lua", false, true)
    if #hits == 0 then
      hits = vim.fn.glob(pack_lua_glob .. "/" .. top, false, true)
    end
    cached = hits[1] and hits[1]:match("^(.*)/lua/") or false
    module_roots[top] = cached
  end
  return cached or nil
end

--- Collect plugin directories referenced by a buffer through `require()` and
--- `---@module` declarations.
---@param buf integer
---@return table<string, true>
local function buffer_roots(buf)
  local found = {}
  for _, line in ipairs(vim.api.nvim_buf_get_lines(buf, 0, -1, false)) do
    for mod in line:gmatch(require_pattern) do
      local root = plugin_root(mod)
      if root then
        found[root] = true
      end
    end
    local mod = line:match(module_pattern)
    if mod then
      local root = plugin_root(mod)
      if root then
        found[root] = true
      end
    end
  end
  return found
end

--- Libraries collected by lazydev, when it is loaded.
---@return string[]
local function lazydev_libraries()
  if not package.loaded["lazydev.workspace"] then
    return {}
  end
  local Workspace = require("lazydev.workspace")
  local seen = {}
  local libs = {}
  for _, ws in pairs(Workspace.workspaces) do
    if ws:enabled() then
      for _, lib in ipairs(ws.library) do
        if not seen[lib] and vim.startswith(lib, "/") and vim.fn.isdirectory(lib) == 1 then
          seen[lib] = true
          libs[#libs + 1] = lib
        end
      end
    end
  end
  return libs
end

local hooked = false

local function hook_lazydev()
  if hooked or not package.loaded["lazydev.workspace"] then
    return
  end
  hooked = true
  local Workspace = require("lazydev.workspace")
  local orig_add = Workspace.add
  ---@param self lazydev.Workspace
  ---@param path string|string[]
  ---@diagnostic disable-next-line: duplicate-set-field, assign-type-mismatch, redundant-parameter
  Workspace.add = function(self, path)
    if type(path) == "table" then
      for _, p in ipairs(path) do
        orig_add(self, p)
      end
    else
      orig_add(self, path)
    end
    vim.schedule(M.sync_all)
  end
end

---@param client vim.lsp.Client
local function sync(client)
  local set = {}
  for root in pairs(discovered) do
    set[root] = true
  end
  for _, lib in ipairs(lazydev_libraries()) do
    set[lib] = true
  end
  local libs = vim.tbl_keys(set)
  table.sort(libs)
  if #libs == 0 then
    return
  end
  local key = table.concat(libs, "\0")
  if pushed[client.id] == key then
    return
  end
  pushed[client.id] = key
  client.settings = client.settings or {}
  local settings = client.settings --[[@as table<string, any>]]
  local emmylua = settings.emmylua or {}
  emmylua.workspace = emmylua.workspace or {}
  emmylua.workspace.library = libs
  settings.emmylua = emmylua
  client:notify("workspace/didChangeConfiguration", { settings = { emmylua = emmylua } })
end

function M.sync_all()
  for _, client in ipairs(vim.lsp.get_clients({ name = "emmylua_ls" })) do
    sync(client)
  end
end

---@param buf integer
local function scan(buf)
  local changed = false
  for root in pairs(buffer_roots(buf)) do
    if not discovered[root] then
      discovered[root] = true
      changed = true
    end
  end
  if changed then
    M.sync_all()
  end
end

---@param buf integer
local function schedule_scan(buf)
  if queued[buf] then
    return
  end
  queued[buf] = true
  vim.defer_fn(function()
    queued[buf] = nil
    if vim.api.nvim_buf_is_valid(buf) then
      scan(buf)
    end
  end, 200)
end

function M.setup()
  local group = vim.api.nvim_create_augroup("emmylua_ls_bridge", { clear = true })
  vim.api.nvim_create_autocmd("LspAttach", {
    group = group,
    callback = function(ev)
      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      if not client or client.name ~= "emmylua_ls" then
        return
      end
      hook_lazydev()
      scan(ev.buf)
    end,
  })
  vim.api.nvim_create_autocmd("LspDetach", {
    group = group,
    callback = function(ev)
      pushed[ev.data.client_id] = nil
    end,
  })
  vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "TextChanged" }, {
    group = group,
    pattern = "*.lua",
    callback = function(ev)
      schedule_scan(ev.buf)
    end,
  })
end

return M
