---@type lz.n.Spec
return {
  "mini.editor",
  event = "DeferredUIEnter",
  after = function()
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
