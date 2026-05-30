local config = {
  backend = "sixel",
}

return {
  "image.nvim",
  ft = { "markdown", "typst", "html", "css" },
  after = {
    require("image").setup(config),
  },
}
