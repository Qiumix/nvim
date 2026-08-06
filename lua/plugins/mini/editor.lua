---@module "zpack"
---@type zpack.Spec
return {
  "nvim-mini/mini.nvim",
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

    require("mini.icons").setup()
  end,
}
