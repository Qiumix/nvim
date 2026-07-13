return {
  "nvim-mini/mini.nvim",
  name = "mini.editor",
  event = "VeryLazy",
  config = function()
    require("mini.cursorword").setup()
    require("mini.surround").setup()
    require("mini.pairs").setup()
    require("mini.cmdline").setup({
      autocomplete = { enable = false },
      autocorrect = { enable = false },
      autopeek = {
        enable = true,
        n_context = 2,
      },
    })
  end,
}