---@type LznPackSpec
return {
  src = "saghen/blink.cmp",
  version = vim.version.range("^1"),
  event = { "InsertEnter", "CmdlineEnter" },
  after = function()
    local config = require("plugins.config.blink")
    require("blink.cmp").setup(config)
  end,
}
