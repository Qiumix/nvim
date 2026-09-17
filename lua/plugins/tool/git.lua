---@module "zpack"
---@type zpack.Spec|zpack.Spec[]
return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = function()
      return require("config.git")
    end,
  },
}
