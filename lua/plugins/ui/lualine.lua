---@module "zpack"
---@type zpack.Spec|zpack.Spec[]
return {
  "nvim-lualine/lualine.nvim",
  opts = require("config.lualine"),
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
