local config = {
  transparent_mode = true,
}
---@type lz.n.Spec
return {
  "gruvbox.nvim",
  colorscheme = "gruvbox",
  after = function()
    require("gruvbox").setup(config)
  end,
}
