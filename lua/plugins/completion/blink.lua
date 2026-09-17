---@module "zpack"
---@type zpack.Spec
return {
  "saghen/blink.cmp",
  version = vim.version.range("^1"),
  dependencies = {
    { "rafamadriz/friendly-snippets" },
  },
  event = { "InsertEnter", "CmdlineEnter" },
  opts = function()
    return require("config.blink")
  end,
}
