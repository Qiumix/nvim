vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.gh_str = function(str) return 'https://github.com/' .. str end
require("config")

vim.pack.add({
  { src = vim.g.gh_str('nvim-lua/plenary.nvim') },
  { src = vim.g.gh_str('wakatime/vim-wakatime') },
  { src = vim.g.gh_str('rachartier/tiny-inline-diagnostic.nvim') },
  { src = vim.g.gh_str("stevearc/oil.nvim") },
  { src = vim.g.gh_str("neovim/nvim-lspconfig") },
  { src = vim.g.gh_str("echasnovski/mini.pick") },
  { src = vim.g.gh_str('windwp/nvim-autopairs') },
  { src = vim.g.gh_str('saecki/crates.nvim') },
  { src = vim.g.gh_str('mikavilpas/yazi.nvim'),                  version = vim.version.range('*') },
})

require("plugins")
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

require 'mini.pick'.setup()
require 'oil'.setup()
require 'crates'.setup()
require 'which-key'.setup({
  preset = 'helix',
})

vim.lsp.enable({
  "lua_ls",
  "rust-analyzer",
  "gopls",
  "clangd",
  "vtsls",
  "vscode-json-language-server",
  "vscode-eslint-language-server",
  "vscode-html-language-server",
  "vscode-css-language-server",
  "jdtls",
})
