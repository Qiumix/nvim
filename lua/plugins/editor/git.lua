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

return {
  "gitsigns.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("gitsigns").setup(config)
  end,
}
