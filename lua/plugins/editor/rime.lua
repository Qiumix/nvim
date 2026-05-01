local config = {
  enabled = true,
  smart_esc = false,
}

return {
  "rime-toggle.nvim",
  after = function()
    require("rime_toggle").setup(config)
  end,
}
