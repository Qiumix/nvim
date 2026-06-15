---@type lz.n.Spec
return {
  "blink.cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  after = function()
    local config = require("plugins.editor.config.blink")
    require("blink.cmp").setup(config)
  end,
}
