---@type vim.lsp.Config
return {
  cmd = { "clice", "serve" },
  filetypes = { "c", "cpp", "cxx", "cc", "h", "hpp" },
  root_markers = { "clice.toml", "compile_commands.json", ".git" },
  init_options = {
    project = {
      clang_tidy = true,
      compile_commands_paths = { "${workspace}/build" },
    },
  },
}
