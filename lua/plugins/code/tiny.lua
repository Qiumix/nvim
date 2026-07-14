---@module "zpack"
---@type zpack.Spec
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  config = function()
    require("tiny-inline-diagnostic").setup({ require("config.tiny") })
    vim.diagnostic.config({ virtual_text = true })
  end,
}
