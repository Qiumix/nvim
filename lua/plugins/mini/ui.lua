---@type lz.n.PluginSpec
return {
  "mini.ui",
  event = "DeferredUIEnter",
  after = function()
    require("mini.icons").setup()
    require("mini.statusline").setup()
    require("mini.indentscope").setup()

    if vim.env.KITTY_SCROLLBACK_NVIM == "true" then
      vim.g.minitabline_disable = true
    end
    require("mini.tabline").setup({})
  end,
}
