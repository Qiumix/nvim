---@type LznPackSpec
return {
  src = "karb94/neoscroll.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("neoscroll").setup({ mappings = {} })
  end,
}
