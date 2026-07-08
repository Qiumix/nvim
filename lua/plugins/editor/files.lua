---@type LznPackSpec
return {
  {
    src = "stevearc/oil.nvim",
    event = "DeferredUIEnter",
    cmd = "Oil",
    after = function()
      require("lz.n").trigger_load("mini.icons")
      require("oil").setup(require("plugins.editor.config.oil"))
    end,
  },
  {
    src = "mikavilpas/yazi.nvim",
    version = vim.version.range("*"),
    event = "DeferredUIEnter",
    cmd = "Yazi",
    after = function()
      require("yazi").setup(require("plugins.editor.config.yazi"))
    end,
  },
}
