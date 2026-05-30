---@type lz.n.PluginSpec
return {
  "tiny-inline-diagnostic.nvim",
  event = "BufEnter",
  after = function()
    require("tiny-inline-diagnostic").setup()
    vim.diagnostic.config()
  end,
}
