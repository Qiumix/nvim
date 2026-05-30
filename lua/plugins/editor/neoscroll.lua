return {
  "neoscroll.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("neoscroll").setup({ mappings = {} })
  end,
}
