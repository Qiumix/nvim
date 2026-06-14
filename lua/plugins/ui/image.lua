local config = {
  backend = (function()
    if vim.env.TERM == "foot" then
      return "sixel"
    else
      return "kitty"
    end
  end)(),
}

return {
  "image.nvim",
  ft = { "markdown", "typst", "html", "css" },
  after = {
    require("image").setup(config),
  },
}
