---@module "zpack"
---@type zpack.Spec
return {
  src = "https://gitlab.com/sairy/zshow.nvim",
  cmd = "ZShow",
  init = function()
    vim.g.zshow_opts = {}
  end,
}
