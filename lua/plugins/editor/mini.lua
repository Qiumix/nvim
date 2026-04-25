return {
  {
    "mini.nvim",
    after = function()
      require("mini.surround").setup()
    end,
  },
  {
    "mini.nvim",
    after = function()
      require("mini.statusline").setup()
    end,
  },
  {
    "mini.nvim",
    after = function()
      require("mini.tabline").setup()
    end,
  },
  {
    "mini.nvim",
    after = function()
      require("mini.icons").setup()
    end,
  },
  {
    "mini.nvim",
    after = function()
      require("mini.cursorword").setup({ delay = 0 })
    end,
  },
}
