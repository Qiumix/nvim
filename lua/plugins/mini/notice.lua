return {
  "mini.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("mini.notify").setup()
  end,
}
