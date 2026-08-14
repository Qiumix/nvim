--- Sync lazydev's dynamically collected libraries into emmylua_ls's emmylua.workspace.library
--- Why: emmylua_ls requests the "Lua" and "emmylua" scopes in order for Neovim clients,
--- the last non-null one wins, and "Lua" top-level keys are ignored by its Emmyrc
--- deserialization, so lazydev's Lua.workspace.library push never takes effect.
local M = {}

local hooked = false

--- Wrap lazydev.workspace.add to trigger a sync when libraries change
local function hook_lazydev()
  if hooked or not package.loaded["lazydev.workspace"] then
    return
  end
  hooked = true
  local Workspace = require("lazydev.workspace")
  local orig_add = Workspace.add
  ---@param self lazydev.Workspace
  ---@param path string|string[]
  local function wrapped_add(self, path)
    if type(path) == "table" then
      for _, p in ipairs(path) do
        orig_add(self, p)
      end
    else
      orig_add(self, path)
    end
    vim.schedule(M.sync_all)
  end
  ---@diagnostic disable-next-line: duplicate-set-field
  ---@diagnostic disable-next-line: assign-type-mismatch
  Workspace.add = wrapped_add
end

--- Collect libraries of all enabled workspaces, deduplicated and sorted
local function collect_libs()
  local Workspace = require("lazydev.workspace")
  local seen = {} ---@type table<string, true>
  local libs = {} ---@type string[]
  for _, ws in pairs(Workspace.workspaces) do
    if ws:enabled() then
      for _, lib in ipairs(ws.library) do
        if not seen[lib] then
          seen[lib] = true
          table.insert(libs, lib)
        end
      end
    end
  end
  table.sort(libs)
  return libs
end

--- Merge the library list into the emmylua section and push didChangeConfiguration
function M.sync(client)
  if not client then
    return
  end
  local ok, libs = pcall(collect_libs)
  if not ok then
    return
  end
  local current = vim.tbl_get(client.settings, "emmylua", "workspace", "library") or {}
  local current_key = table.concat(
    vim.tbl_filter(function(p)
      return type(p) == "string"
    end, current),
    "\0"
  )
  if table.concat(libs, "\0") == current_key then
    return
  end
  local emmylua = vim.tbl_deep_extend("force", client.settings.emmylua or {}, {
    workspace = { library = libs },
  })
  client.settings.emmylua = emmylua
  pcall(function()
    client:notify("workspace/didChangeConfiguration", { settings = { emmylua = emmylua } })
  end)
end

function M.sync_all()
  for _, client in ipairs(vim.lsp.get_clients({ name = "emmylua_ls" })) do
    M.sync(client)
  end
end

function M.setup()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("emmylua_ls_bridge", { clear = true }),
    callback = function(ev)
      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      if client and client.name == "emmylua_ls" then
        hook_lazydev()
        vim.schedule(function()
          M.sync(client)
        end)
      end
    end,
  })
end

return M
