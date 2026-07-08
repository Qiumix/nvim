---@type LznPackSpec
return {
  src = "gbprod/yanky.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("yanky").setup()
  end,
}
