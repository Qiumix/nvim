---@module "zpack"
---@type zpack.Spec
return {
  "saghen/blink.cmp",
  version = vim.version.range("^1"),
  dependencies = { "rafamadriz/friendly-snippets" },
  event = { "InsertEnter", "CmdlineEnter" },
  opts = require("config.blink"),
}
