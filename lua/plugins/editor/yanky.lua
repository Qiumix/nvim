return {
  "yanky.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("yanky").setup()
  end,
}
