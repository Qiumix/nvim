---@type lz.n.PluginSpec
return {
  "which-key.nvim",
  after = function()
    local keys = require("plugins.editor.config.whichkey")
    local wk = require("which-key")
    wk.setup({
      preset = "helix",
      win = {
        wo = {
          winblend = 20,
        },
      },
    })
    wk.add(keys)
  end,
}
