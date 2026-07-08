---@type LznPackSpec
return {
  after = function()
    local keys = require("plugins.config.whichkey")
    local wk = require("which-key")
    wk.setup({
      preset = "helix",
      win = {
        wo = {
          winblend = 20,
        },
      },
    })
    wk.add(keys)
  end,
  src = "folke/which-key.nvim",
}
