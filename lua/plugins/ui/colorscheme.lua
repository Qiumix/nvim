local config = {
  transparent_mode = true,
}

---@module "zpack"
---@type zpack.Spec
return {
  src = "ellisonleao/gruvbox.nvim",

  opts = config,
  after = function(_, opts)
    require("gruvbox").setup(opts)
  end,
}
