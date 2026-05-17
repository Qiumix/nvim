local config = require("plugins.editor.snack.config")

return {
  "snacks.nvim",
  after = function()
    local Snacks = require("snacks")
    Snacks.setup(config)
  end,
}
