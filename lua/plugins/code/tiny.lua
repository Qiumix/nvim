---@type LznPackSpec
return {
  src = "rachartier/tiny-inline-diagnostic.nvim",
  event = "DeferredUIEnter",
  lazy = false,
  after = function()
    require("tiny-inline-diagnostic").setup({ require("plugins.config.tiny") })
    vim.diagnostic.config({ virtual_text = false })
  end,
}
