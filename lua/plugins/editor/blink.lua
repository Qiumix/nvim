local config = require("plugins.editor.blink.config")

---@type lz.n.PluginSpec
return {
  "blink.cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  after = function()
    require("blink.cmp").setup(config)
  end,
}
