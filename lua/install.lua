vim.pack.add({
  { src = gh('nvim-lua/plenary.nvim') },
  { src = gh('MunifTanjim/nui.nvim') },
  { src = gh('rcarriga/nvim-notify') },
  { src = gh('wakatime/vim-wakatime') },
  { src = gh('rachartier/tiny-inline-diagnostic.nvim') },
  -- { src = gh('stevearc/oil.nvim') },
  { src = gh('tris203/precognition.nvim') },
  { src = gh('nvzone/showkeys') },
  { src = gh('numToStr/FTerm.nvim') },
  -- { src = gh('m4xshen/hardtime.nvim') },
  { src = gh('neovim/nvim-lspconfig') },
  { src = gh('folke/noice.nvim') },
  { src = gh('windwp/nvim-autopairs') },
  { src = gh('saecki/crates.nvim') },
  { src = gh('mikesmithgh/kitty-scrollback.nvim') },
  { src = gh('ibhagwan/fzf-lua') },
  { src = gh('SilverofLight/kd_translate.nvim') },
  { src = gh('sitiom/nvim-numbertoggle') },
  {
    src = gh('mikavilpas/yazi.nvim'),
    version = vim.version.range('*')
  },
})
