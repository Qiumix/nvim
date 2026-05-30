---@type lz.n.PluginSpec
return {
  "colorful-menu.nvim",
  after = function()
    require("colorful-menu").setup({})
  end,
}
