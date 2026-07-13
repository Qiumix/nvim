---@module "zpack"
---@type zpack.Spec
return {
  src = "https://gitlab.com/sairy/zshow.nvim",
  lazy = false,
  init = function()
    vim.g.zshow_opts = {}
  end,
}
