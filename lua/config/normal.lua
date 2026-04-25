local default_keymaps = {
  { keys = "<leader>ca", func = vim.lsp.buf.code_action, desc = "Code Actions" },
  { keys = "<leader>cr", func = vim.lsp.buf.rename,      desc = "Code Rename" },
  { keys = "K",          func = vim.lsp.buf.hover,       desc = "Hover Documentation", has = "hoverProvider" },
  { keys = "gd",         func = vim.lsp.buf.definition,  desc = "Goto Definition",     has = "definitionProvider" },
}

local ts_server = vim.g.lsp_typescript_server or "vtsls"

-- Enable LSP servers for Neovim 0.11+
vim.lsp.enable({
  "eslint",
  "lua_ls",
  "gopls",
  "rust_analyser",
  "zls",
  "cssls",
  "html",
  "helm_ls",
  "jsonls",
  "biome",
  "clangd",
  "vscode-json-language-server",
  "vscode-eslint-language-server",
  "vscode-html-language-server",
  "vscode-css-language-server",
  "bash-language-server",
  "vue-language-server",
  "fish_lsp",
  "sql-language-server",
  "jdtls",
  "typstyle",
  "tinymist",
  "yamlls",
  ts_server,
})
