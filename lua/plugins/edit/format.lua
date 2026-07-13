return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  config = function()
    require("conform").setup(require("plugins.config.format"))
  end,
}