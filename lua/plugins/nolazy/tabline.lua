require("mini.tabline").setup()
return {
  "mini.nvim",
  after = function()
    require("mini.tabline").setup()
  end,
}
