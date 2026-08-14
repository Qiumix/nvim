---@module "zpack"
---@type zpack.Spec
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach",
  config = function()
    require("tiny-inline-diagnostic").setup(require("config.tiny"))
    vim.diagnostic.config({ virtual_text = false })
  end,
}
