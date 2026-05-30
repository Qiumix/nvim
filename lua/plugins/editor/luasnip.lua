return {
  "LuaSnip",
  event = "InsertEnter",
  after = function()
    require("luasnip").setup()
  end,
}
