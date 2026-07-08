local config = {
  transparent_mode = true,
}
---@type LznPackSpec
return {
  src = "ellisonleao/gruvbox.nvim",

  after = function()
    require("gruvbox").setup(config)
  end,
}
