---@module "zpack"
---@type zpack.Spec

return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  opts = require("config.format"),
}
