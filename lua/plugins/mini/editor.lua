---@type lz.n.PluginSpec
return {
  "mini.editor",
  event = { "BufReadPre", "BufNewFile" },
  after = function()
    require("mini.cursorword").setup()
    require("mini.surround").setup()
    require("mini.pairs").setup()
  end,
}
