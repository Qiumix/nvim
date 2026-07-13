---@module "zpack"
---@type zpack.Spec

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
  enabled = false,
  "3rd/image.nvim",
  ft = { "markdown", "typst", "html", "css" },
  config = function()
    require("image").setup(config)
  end,
}
