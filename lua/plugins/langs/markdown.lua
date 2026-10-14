---@module "zpack"
---@type zpack.Spec
return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "norg", "org" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
  },
  opts = function()
    return require("config.markdown")
  end,
}
