---@type LznPackSpec
return {
  {
    src = "lewis6991/gitsigns.nvim",
    event = "DeferredUIEnter",
    after = function()
      local config = require("plugins.editor.config.git")
      require("gitsigns").setup(config)
    end,
  },
}
