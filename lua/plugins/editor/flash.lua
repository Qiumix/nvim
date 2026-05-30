local config = require("plugins.editor.flash.config")

---@type lz.n.PluginSpec
return {
  "flash.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("flash").setup(config)
  end,
}
