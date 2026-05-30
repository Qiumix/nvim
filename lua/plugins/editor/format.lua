local config = require("plugins.editor.formater.config")

---@type lz.n.PluginSpec
return {
  "conform.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("conform").setup(config)
  end,
}
