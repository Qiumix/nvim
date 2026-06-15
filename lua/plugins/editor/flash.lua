---@type lz.n.Spec
return {
  "flash.nvim",
  event = "DeferredUIEnter",
  after = function()
    local config = require("plugins.editor.config.flash")
    require("flash").setup(config)
  end,
}
