return {
  "mini.editor",
  event = "DeferredUIEnter",
  after = function()
    require("mini.git").setup()
    require("mini.cursorword").setup()
    require("mini.surround").setup()
    require("mini.pairs").setup()
  end,
}
