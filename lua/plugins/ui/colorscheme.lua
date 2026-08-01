---@module "zpack"
---@type zpack.Spec|zpack.Spec[]
return {
  {
    "sainnhe/gruvbox-material",
    config = function()
      local g = vim.g

      g.gruvbox_material_transparent_background = 2
      g.gruvbox_material_background = "soft"
      g.gruvbox_material_foreground = "mix"
      g.gruvbox_material_cursor = "auto"
      g.gruvbox_material_enable_italic = 1
      g.gruvbox_material_enable_bold = 1
      g.gruvbox_material_menu_selection_background = "orange"
      g.gruvbox_material_statusline_style = "mix"
      g.gruvbox_material_better_performance = 1
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    opts = { transparent_mode = true },
  },
  -- {
  --   "folke/tokyonight.nvim",
  -- },
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  -- },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   opt = {
  --     transparent = true,
  --   },
  -- },
  -- {
  --   "kepano/flexoki",
  -- },
  -- {
  --   "sainnhe/everforest",
  -- },
}
