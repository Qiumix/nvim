---@module "zpack"
---@type zpack.Spec
return {
  "folke/flash.nvim",
  enabled = true,
  event = "VeryLazy",
  opts = function()
    return require("config.flash")
  end,
}
