return {
  "LuaSnip",
  event = "BufEnter",
  after = function()
    require("luasnip").setup()
  end,
}
