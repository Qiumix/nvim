---@type lz.n.Spec
return {
  {
    "gitsigns.nvim",
    event = "DeferredUIEnter",
    after = function()
      local config = require("plugins.editor.config.git")
      require("gitsigns").setup(config)
    end,
  },
}
