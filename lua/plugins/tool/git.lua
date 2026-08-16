---@module "zpack"
---@type zpack.Spec|zpack.Spec[]
return {
  {
    "lewis6991/gitsigns.nvim",
    event = "UIEnter",
    opts = require("config.git"),
  },
}
