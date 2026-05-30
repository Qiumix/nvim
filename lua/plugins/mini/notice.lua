---@type lz.n.PluginSpec
return {
  "mini.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("mini.notify").setup()
  end,
}
