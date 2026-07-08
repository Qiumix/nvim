---@type LznPackSpec
return {
  src = "nvim-mini/mini.nvim",
  name = "mini.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("mini.notify").setup()
  end,
}
