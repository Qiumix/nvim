---@module "zpack"
---@type zpack.Spec|zpack.Spec
return {
  {
    "uga-rosa/ccc.nvim",
    event = "VeryLazy",
    opts = {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    },
  },
  {
    "brenoprata10/nvim-highlight-colors",
    event = "UIEnter",
    opts = {},
  },
}
