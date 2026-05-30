local config = require("plugins.editor.formater.config")

return {
  "conform.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("conform").setup(config)
  end,
}
