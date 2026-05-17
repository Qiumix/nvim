local config = {
  animate = { enabled = true },
  bigfile = { enabled = true },
  dashboard = { enabled = false },
  dim = { enabled = true },
  explorer = { enabled = true, replace_netrw = true },
  image = require("plugins.editor.snack.image"),
  indent = { enabled = true },
  input = { enabled = true },
  layout = { enabled = true },
  notifier = { enabled = false },
  quickfile = { enabled = true },
  scope = { enabled = true },
  scratch = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  terminal = { enabled = true },
  toggle = { enabled = true },
  words = { enabled = false },
  zen = { enabled = true },

  picker = require("plugins.editor.snack.picker"),
}

return {
  "snacks.nvim",
  after = function()
    local Snacks = require("snacks")
    Snacks.setup(config)
  end,
}
