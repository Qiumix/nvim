return {
  "uga-rosa/ccc.nvim",
  event = "VeryLazy",
  config = function()
    local ccc = require("ccc")
    ccc.setup({})
  end,
}