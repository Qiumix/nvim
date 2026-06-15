---@type lz.n.Spec
return {
  "neoscroll.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("neoscroll").setup({ mappings = {} })
  end,
}
