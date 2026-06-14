---@type lz.n.PluginSpec
return {
  "mini.ai",
  event = "DeferredUIEnter",
  after = function()
    require("mini.ai").setup()
  end,
}
