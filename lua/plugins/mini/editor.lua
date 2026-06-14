---@type lz.n.PluginSpec
return {
  "mini.editor",
  event = "DeferredUIEnter",
  after = function()
    require("mini.cursorword").setup()
    require("mini.surround").setup()
    require("mini.pairs").setup()
  end,
}
