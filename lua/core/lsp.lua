-- nvim-lspconfig is lazy; requiring it here makes zpack packadd it so the base
-- `lsp/*.lua` configs are on rtp before `vim.lsp.enable` resolves them.
require("lspconfig")

vim.lsp.enable({
  "bashls",
  "biome",
  "clangd",
  -- "clice",
  "cssls",
  "emmylua_ls",
  "fish_lsp",
  "gopls",
  -- "harper_ls",
  "html",
  "hyprls",
  "jdtls",
  "jsonls",
  "kmp-lsp",
  -- "lua_ls",
  "nushell",
  "pyrefly",
  "ron-lsp",
  -- "scheme-langserver",
  "slint_lsp",
  "sqlls",
  "steel-language-server",
  "taplo",
  "tinymist",
  "vtsls",
  "wgsl_analyzer",
  "yamlls",
  "zls",
})
