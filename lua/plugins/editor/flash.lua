local config = require("plugins.editor.flash.config")
return {
  "flash.nvim",
  after = function()
    require("flash").setup(config)
  end,
}
