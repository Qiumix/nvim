local config = require("plugins.editor.flash.config")
return {
  "flash.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("flash").setup(config)
  end,
}
