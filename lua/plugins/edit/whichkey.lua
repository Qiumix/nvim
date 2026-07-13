return {
  "folke/which-key.nvim",
  event = "UIEnter",
  opts = {
    preset = "helix",
    win = {
      wo = {
        winblend = 20,
      },
    },
  },
  config = function(plugin, opts)
    local keys = require("keymap")
    local wk = require("which-key")
    wk.setup(opts)
    wk.add(keys)
  end,
}
