---@module "zpack"
---@type zpack.Spec
return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
      local config = require("config.git")
      require("gitsigns").setup(config)
    end,
  },
}
