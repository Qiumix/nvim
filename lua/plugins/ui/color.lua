---@type lz.n.Spec
return {
  "ccc.nvim",
  event = "DeferredUIEnter",
  after = function()
    local ccc = require("ccc")
    ccc.setup({})
  end,
}
