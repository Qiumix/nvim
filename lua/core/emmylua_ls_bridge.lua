---@diagnostic disable: need-check-nil
--- Forward lazydev's dynamic library list to emmylua_ls.
---
--- emmylua_ls reads `workspace.library` statically and has no glob support, and
--- lazydev emits LuaLS-shaped settings (`Lua.workspace.library`) that
--- emmylua_ls ignores. But lazydev already does the discovery we want: it
--- watches Lua buffers for `require()` / `---@module "x"` and resolves each to
--- the owning plugin's library for every client in `Lsp.supported_clients`
--- (lua_ls AND emmylua_ls). This module only re-publishes that list as
--- `emmylua.workspace.library` -- the only scope emmylua_ls honours for Neovim
--- clients.
local M = {}

--- client id -> key of the last library list pushed to it.
---@type table<integer, string>
local pushed = {}

--- Union of every enabled lazydev workspace library.
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
    orig_add(self, path)
    vim.schedule(M.sync_all)
  end
end

---@param client vim.lsp.Client
local function sync(client)
  local libs = lazydev_libraries()
  if #libs == 0 then
    return
  end
  table.sort(libs)
  local key = table.concat(libs, "\0")
  if pushed[client.id] == key then
    return
  end
  pushed[client.id] = key
  local settings = client.settings --[[@as table<string, any>]]
  settings.emmylua = settings.emmylua or {}
  local emmylua = settings.emmylua
  emmylua.workspace = emmylua.workspace or {}
  emmylua.workspace.library = libs
  client:notify("workspace/didChangeConfiguration", { settings = { emmylua = emmylua } })
end

function M.sync_all()
  for _, client in ipairs(vim.lsp.get_clients({ name = "emmylua_ls" })) do
    sync(client)
  end
end

local autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup("emmylua_ls_bridge", { clear = true })

function M.setup()
  autocmd("LspAttach", {
    group = group,
    callback = function(ev)
      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      if not client or client.name ~= "emmylua_ls" then
        return
      end
      hook_lazydev()
      M.sync_all()
    end,
  })
  autocmd("LspDetach", {
    group = group,
    callback = function(ev)
      pushed[ev.data.client_id] = nil
    end,
  })
  -- lazydev is itself lazy (ft=lua / VeryLazy). If it loads after emmylua_ls
  -- attaches, the LspAttach hook above was a no-op; VeryLazy fires once lazydev
  -- is loaded, so hook (and re-sync) there as well.
  autocmd("User", {
    group = group,
    pattern = "VeryLazy",
    once = true,
    callback = function()
      hook_lazydev()
      M.sync_all()
    end,
  })
end

return M
