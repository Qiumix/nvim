---@type LznPackSpec
return {
  src = "rachartier/tiny-inline-diagnostic.nvim",
  event = "DeferredUIEnter",
  lazy = false,
  after = function()
    require("tiny-inline-diagnostic").setup({ require("plugins.editor.config.tiny") })
    vim.diagnostic.config({ virtual_text = false })
  end,
}
