---@type LznPackSpec
return {
  src = "chentoast/marks.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("marks").setup()
  end,
}
