---@type lz.n.PluginSpec
return {
  "neoscroll.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("neoscroll").setup({ mappings = {} })
  end,
}
