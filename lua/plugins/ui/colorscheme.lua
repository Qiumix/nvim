---@module "zpack"
---@type zpack.Spec|zpack.Spec[]
return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      transparent_mode = true,
      overrides = {
        StatusLine = { fg = "NONE", bg = "NONE" },
        StatusLineNC = { fg = "NONE", bg = "NONE" },
        TabLineFill = { fg = "NONE", bg = "NONE" },
        TabLine = { fg = "NONE", bg = "NONE" },
        TabLineSel = { fg = "NONE", bg = "NONE" },
      },
    },
  },
  {
    "folke/tokyonight.nvim",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },
  {
    "rebelot/kanagawa.nvim",
    opt = {
      transparent = true,
    },
  },
  {
    "kepano/flexoki",
  },
  {
    "sainnhe/everforest",
  },
}
