---@type LznPackSpec
return {
  enabled = false,
  src = "milanglacier/minuet-ai.nvim",
  event = { "InsertEnter", "CmdlineEnter" },
  after = function()
    local config = require("config.minuet")
    require("minuet").setup(config)
  end,
}
