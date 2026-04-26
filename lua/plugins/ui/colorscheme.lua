local config = {
  transparent_mode = true,
}

return {
  "gruvbox.nvim",
  colorscheme = "gruvbox",
  after = function()
    require("gruvbox").setup(config)
  end,
}
