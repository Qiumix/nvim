---@module "zpack"
---@type zpack.Spec|zpack.Spec[]
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    return require("config.lualine")
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
