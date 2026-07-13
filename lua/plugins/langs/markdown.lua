return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "norg", "org" },
  config = function()
    require("render-markdown").setup()
  end,
}