return {
  "folke/snacks.nvim",
  event = "VeryLazy",
  config = function()
    local config = require("plugins.snack.snack")
    local Snacks = require("snacks")
    Snacks.setup(config)
  end,
}
