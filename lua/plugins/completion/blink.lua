---@module "zpack"
---@type zpack.Spec
return {
  "saghen/blink.cmp",
  version = vim.version.range("^1"),
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      version = vim.version.range("^2"),
      event = "InsertEnter",
      config = function()
        require("luasnip").setup()
      end,
      dependencies = { "rafamadriz/friendly-snippets" },
    },
  },
  event = { "InsertEnter", "CmdlineEnter" },
  opts = function()
    return require("config.blink")
  end,
}
