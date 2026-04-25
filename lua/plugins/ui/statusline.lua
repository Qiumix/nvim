require("mini.statusline").setup()
return {
  {
    "mini.nvim",
    lazy = false,
    after = function()
      require("mini.statusline").setup()
    end,
  },
}
