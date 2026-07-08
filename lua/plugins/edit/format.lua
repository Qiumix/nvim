---@type LznPackSpec
return {
  src = "stevearc/conform.nvim",
  event = "DeferredUIEnter",
  after = function()
    local config = require("plugins.config.format")
    require("conform").setup(config)
  end,
}
