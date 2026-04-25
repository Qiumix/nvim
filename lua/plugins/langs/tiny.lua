return {
  "tiny-inline-diagnostic.nvim",
  after = function()
    require("tiny-inline-diagnostic").setup()
    vim.diagnostic.config({ virtual_text = false })
  end,
}
