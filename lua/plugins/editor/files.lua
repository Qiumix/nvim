---@type lz.n.PluginSpec
return {
  "oil.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("oil").setup()
  end,
}
