---@module "zpack"
---@type zpack.Spec

return {
  "Qiumix/rime-toggle.nvim",
  config = function()
    require("rime_toggle").setup()
  end,
}
