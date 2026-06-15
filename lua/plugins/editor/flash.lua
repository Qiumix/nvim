---@type lz.n.PluginSpec
return {
  "flash.nvim",
  event = "DeferredUIEnter",
  after = function()
    local config = require("plugins.editor.config.flash")
    require("flash").setup(config)
  end,
}
