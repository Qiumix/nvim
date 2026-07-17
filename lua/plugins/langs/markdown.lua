---@module "zpack"
---@type zpack.Spec
return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "norg", "org" },
  dependencies = {
    "nvim-mini/mini.icons",
  },
  opts = require("config.markdown"),
}
