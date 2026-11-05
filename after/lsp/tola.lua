---@type vim.lsp.Config
return {
  cmd = { "tola", "lsp" },
  filetypes = { "typst" },
  root_markers = { "tola.toml" },
  workspace_required = true,
}
