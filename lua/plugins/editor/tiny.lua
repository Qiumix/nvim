---@type lz.n.PluginSpec
return {
  "tiny-inline-diagnostic.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("tiny-inline-diagnostic").setup()
    vim.diagnostic.config()
  end,
}
