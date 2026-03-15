require("flash").setup({
  modes = {
    char = {
      enabled = true,
      multi_line = false,
      autojump = true,
      keys = { "f", "F", "t", "T", ";", "," },
      highlight = { backdrop = false },
    },
  },
})
