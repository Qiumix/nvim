---@type LznPackSpec
return {
  src = "L3MON4D3/LuaSnip",
  version = vim.version.range("^2"),
  event = "InsertEnter",
  after = function()
    require("luasnip").setup()
  end,
}
