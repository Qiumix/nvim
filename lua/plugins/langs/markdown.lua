---@type LznPackSpec
return {
  src = "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "norg", "org" },
  after = function()
    require("render-markdown").setup()
  end,
}
