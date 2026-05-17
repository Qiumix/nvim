local config = require("plugins.editor.blink.config")

return {
  "blink.cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  after = function()
    require("blink.cmp").setup(config)
  end,
}
