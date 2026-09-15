---@module "zpack"
---@type zpack.Spec
return {
  "folke/flash.nvim",
  enabled = true,
  event = "VeryLazy",
  opts = require("config.flash"),
}
