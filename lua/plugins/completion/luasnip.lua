return {
  "L3MON4D3/LuaSnip",
  version = vim.version.range("^2"),
  event = "InsertEnter",
  config = function()
    require("luasnip").setup()
  end,
}
