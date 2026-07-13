---@module "zpack"
---@type zpack.Spec

return {
  {
    "mikavilpas/yazi.nvim",
    version = vim.version.range("*"),
    event = "VeryLazy",
    cmd = "Yazi",
    config = function()
      require("yazi").setup(require("config.yazi"))
    end,
  },
}
