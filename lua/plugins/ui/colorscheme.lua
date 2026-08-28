---@module "zpack"
---@type zpack.Spec|zpack.Spec[]
return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      terminal_colors = true, -- add neovim terminal colors
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "soft", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      dim_inactive = false,
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
