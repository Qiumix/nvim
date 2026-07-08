---@type LznPackSpec
return {
  src = "folke/flash.nvim",
  event = "DeferredUIEnter",
  after = function()
    local config = require("plugins.config.flash")
    require("flash").setup(config)
  end,
}
