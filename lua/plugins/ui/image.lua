local config = {
  backend = (function()
    if vim.env.TERM == "foot" then
      return "sixel"
    else
      return "kitty"
    end
  end)(),
}

---@type LznPackSpec
return {
  src = "3rd/image.nvim",
  ft = { "markdown", "typst", "html", "css" },
  after = function()
    require("image").setup(config)
  end,
}
