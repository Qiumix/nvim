vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.start_time = vim.fn.reltime()
vim.loader.enable()

vim.g.gh = function(str) return 'https://github.com/' .. str end
require("config")

vim.pack.add({
  { src = vim.g.gh('nvim-lua/plenary.nvim') },
  -- { src = vim.g.gh_str('MunifTanjim/nui.nvim') },
  { src = vim.g.gh('wakatime/vim-wakatime') },
  { src = vim.g.gh('rachartier/tiny-inline-diagnostic.nvim') },
  -- { src = vim.g.gh_str("stevearc/oil.nvim") },
  -- { src = vim.g.gh_str("tris203/precognition.nvim") },
  { src = vim.g.gh("nvzone/showkeys") },
  { src = vim.g.gh("numToStr/FTerm.nvim") },
  -- { src = vim.g.gh_str("m4xshen/hardtime.nvim") },
  { src = vim.g.gh("neovim/nvim-lspconfig") },
  { src = vim.g.gh('windwp/nvim-autopairs') },
  { src = vim.g.gh('saecki/crates.nvim') },
  { src = vim.g.gh('mikesmithgh/kitty-scrollback.nvim') },
  { src = vim.g.gh('ibhagwan/fzf-lua') },
  { src = vim.g.gh('SilverofLight/kd_translate.nvim') },
  { src = vim.g.gh('sitiom/nvim-numbertoggle') },
  { src = vim.g.gh('mikavilpas/yazi.nvim'),                  version = vim.version.range('*') },
})


require("plugins")
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- require 'oil'.setup()
require 'crates'.setup()
require('kitty-scrollback').setup()
require 'FTerm'.setup({
  dimensions = {
    height = 0.8,
    width = 0.8,
  },
})
-- require('hardtime').setup()

-- require('precognition').setup()
-- if require("precognition").toggle() then
--   vim.notify("precognition on")
-- else
--   vim.notify("precognition off")
-- end
-- require("precognition").peek()

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
  "bash-language-server",
  "fish_lsp",
  "jdtls",
})
