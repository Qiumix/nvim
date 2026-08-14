-- NOTE: npm i -g vscode-langservers-extracted

return {
  cmd = { "vscode-json-languageserver", "--stdio" },
  filetypes = { "json", "jsonc" },
  settings = {
    json = {
      validate = { enable = true },
    },
  },
}
