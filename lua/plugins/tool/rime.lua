---@module "zpack"
---@type zpack.Spec
return {
  "Qiumix/rime-toggle.nvim",
  lazy = false,
  config = function()
    require("rime_toggle").setup()
  end,
}
