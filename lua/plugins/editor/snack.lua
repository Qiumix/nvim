---@type LznPackSpec
return {
  src = "folke/snacks.nvim",
  event = "DeferredUIEnter",
  after = function()
    local config = require("plugins.editor.config.snack")
    local Snacks = require("snacks")
    Snacks.setup(config)
  end,
}
