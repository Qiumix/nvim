require("mini.tabline").setup()
return {
  "mini.nvim",
  lazy = false,
  after = function()
    require("mini.tabline").setup()
  end,
}
