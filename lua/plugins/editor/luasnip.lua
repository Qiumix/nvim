---@type lz.n.PluginSpec
return {
  "LuaSnip",
  event = "InsertEnter",
  after = function()
    require("luasnip").setup()
  end,
}
