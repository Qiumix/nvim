local config = {
  enabled = true,
  smart_esc = true,
}

return {
  "rime-toggle.nvim",
  after = function()
    require("rime_toggle").setup(config)
  end,
}
