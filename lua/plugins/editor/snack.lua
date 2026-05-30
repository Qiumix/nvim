local config = require("plugins.editor.snack.config")

---@type lz.n.PluginSpec
return {
  "snacks.nvim",
  event = "DeferredUIEnter",
  after = function()
    local Snacks = require("snacks")
    Snacks.setup(config)
  end,
}
