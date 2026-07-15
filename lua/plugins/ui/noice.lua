---@module "zpack"
---@type zpack.Spec|zpack.Spec[]
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = require("config.noice"),
  dependencies = {
    "MunifTanjim/nui.nvim",
    { "rcarriga/nvim-notify", opts = { background_colour = "#000000", timeout = 1 } },
  },
}
