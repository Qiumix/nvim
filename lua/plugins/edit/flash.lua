return {
  "folke/flash.nvim",
  event = "VeryLazy",
  config = function()
    require("flash").setup(require("plugins.config.flash"))
  end,
}