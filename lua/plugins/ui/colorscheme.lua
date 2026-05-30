local config = {
  transparent_mode = true,
}
---@type lz.n.PluginSpec
return {
  "gruvbox.nvim",
  colorscheme = "gruvbox",
  after = function()
    require("gruvbox").setup(config)
  end,
}
