-- nvim-lspconfig is lazy; requiring it here makes zpack packadd it so the base
-- `lsp/*.lua` configs are on rtp before `vim.lsp.enable` resolves them.
require("lspconfig")

local rust_ls = vim.env.RA == "true" and "rust_analyzer" or "rust_glancer"
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
  "jsonls",
  "kmp-lsp",
  -- "lua_ls",
  "nushell",
  "pyrefly",
  "ron-lsp",
  rust_ls,
  -- "scheme-langserver",
  "slint_lsp",
  "sqlls",
  "steel-language-server",
  "taplo",
  "tinymist",
  "tola",
  "vtsls",
  "wgsl_analyzer",
  "yamlls",
  "zls",
})
