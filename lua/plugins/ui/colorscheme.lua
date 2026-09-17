---@module "zpack"
---@type zpack.Spec|zpack.Spec[]
return {
  {
    "ellisonleao/gruvbox.nvim",
    event = "VeryLazy",
    opts = require("config.gruvbox"),
    config = function(_, opts)
      require("gruvbox").setup(opts)
      vim.cmd("colorscheme gruvbox")
    end,
  },
}
