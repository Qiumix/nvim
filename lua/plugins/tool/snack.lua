---@module "zpack"
---@type zpack.Spec
return {
  "folke/snacks.nvim",
  event = "VeryLazy",
  config = function()
    local config = require("config.snack")
    local Snacks = require("snacks")
    Snacks.setup(config)
  end,
}
