local keys = require("plugins.editor.wk.keys")

---@type lz.n.PluginSpec
return {
  "which-key.nvim",
  event = "DeferredUIEnter",
  after = function()
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
