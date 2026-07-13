return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
      local config = require("plugins.config.git")
      require("gitsigns").setup(config)
    end,
  },
}