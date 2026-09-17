---@module "zpack"
---@type zpack.Spec
return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  opts = function()
    return require("config.format")
  end,
}
