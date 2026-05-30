require("mini.git").setup()
return {
  "mini.ui",
  event = "DeferredUIEnter",
  after = function()
    require("mini.icons").setup()
    require("mini.statusline").setup()
    require("mini.tabline").setup()
    require("mini.indentscope").setup()
  end,
}
