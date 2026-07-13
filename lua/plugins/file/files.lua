---@type LznPackSpec
return {
  {
    src = "mikavilpas/yazi.nvim",
    version = vim.version.range("*"),
    event = "DeferredUIEnter",
    cmd = "Yazi",
    after = function()
      require("yazi").setup(require("plugins.config.yazi"))
    end,
  },
}
