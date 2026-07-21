---@module "zpack"
---@type zpack.Spec
return {
  "folke/flash.nvim",
  enabled = false,
  event = "VeryLazy",
  opts = require("config.flash"),
}
