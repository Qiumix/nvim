---@type LznPackSpec
return {
  event = "InsertEnter",
  src = "xzbdmw/colorful-menu.nvim",
  after = function()
    require("colorful-menu").setup({})
  end,
}
