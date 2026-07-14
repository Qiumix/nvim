---@module "zpack"
---@type zpack.Spec
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = require("config.flash"),
}
