---@type lz.n.Spec
return {
  "conform.nvim",
  event = "DeferredUIEnter",
  after = function()
    local config = require("plugins.editor.config.format")
    require("conform").setup(config)
  end,
}
