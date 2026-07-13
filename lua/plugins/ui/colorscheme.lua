local config = {
  transparent_mode = true,
}

---@module "zpack"
---@type zpack.Spec
return {
  src = "ellisonleao/gruvbox.nvim",

  after = function()
    require("gruvbox").setup(config)
  end,
}
