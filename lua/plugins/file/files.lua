---@module "zpack"
---@type zpack.Spec|zpack.Spec[]
return {
  {
    "mikavilpas/yazi.nvim",
    version = vim.version.range("*"),
    event = "VeryLazy",
    cmd = "Yazi",
    dependencies = {
      "askfiy/smart-translate.nvim",
    },
    config = function()
      require("yazi").setup(require("config.yazi"))
    end,
  },
}
