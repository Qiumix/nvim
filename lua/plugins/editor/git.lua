local sign = {
  add = { text = "▎" },
  change = { text = "▎" },
  delete = { text = "" },
  topdelete = { text = "" },
  changedelete = { text = "▎" },
  untracked = { text = "▎" },
}

local config = {
  current_line_blame = true,
  signs = sign,
  signs_staged = sign,
}

---@type lz.n.PluginSpec
return {
  "gitsigns.nvim",
  event = "DeferredUIEnter",
  after = function()
    vim.g.git = require("gitsigns")
    vim.g.git.setup(config)
  end,
}
