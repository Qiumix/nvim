return {
  "mini.ai",
  lazy = true,
  event = "DeferredUIEnter",
  after = function()
    require("mini.ai").setup()
  end,
}
