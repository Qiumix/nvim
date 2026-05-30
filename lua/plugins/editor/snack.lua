local config = require("plugins.editor.snack.config")

return {
  "snacks.nvim",
  event = "DeferredUIEnter",
  after = function()
    local Snacks = require("snacks")
    Snacks.setup(config)
  end,
}
