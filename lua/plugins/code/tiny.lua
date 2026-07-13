return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  lazy = false,
  config = function()
    require("tiny-inline-diagnostic").setup({ require("plugins.config.tiny") })
    vim.diagnostic.config({ virtual_text = false })
  end,
}