-- Use lazydev to dynamically collect plugin libraries, synced into
-- emmylua.workspace.library (replaces loading all runtime files at once)
require("config.emmylua_ls_bridge").setup()

local root_markers1 = {
  ".emmyrc.json",
  ".emmyrc.lua",
  ".luarc.json",
  ".luarc.jsonc",
}
local root_markers2 = {
  ".luacheckrc",
  ".stylua.toml",
  "stylua.toml",
  "selene.toml",
  "selene.yml",
}

---@type vim.lsp.Config
return {
  cmd = { "emmylua_ls" },
  filetypes = { "lua" },
  root_markers = { root_markers1, root_markers2, { ".git" } },
  workspace_required = false,
  settings = {
    emmylua = {
      codeLens = { enable = true },
      hint = { enable = true },
    },
  },
}
