---@type LznPackSpec
return {
  src = "xzbdmw/colorful-menu.nvim",
  after = function()
    require("colorful-menu").setup({})
  end,
}
