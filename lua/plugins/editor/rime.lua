local config = {
  enabled = true,
}

return {
  "rime-toggle.nvim",
  after = function()
    require("rime_toggle").setup(config)
  end,
}
