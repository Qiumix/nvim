local status_line_config = {}

---@type LznPackSpec
return {
  src = "nvim-mini/mini.nvim",
  name = "mini.ui",
  event = "DeferredUIEnter",
  after = function()
    require("mini.icons").setup()
    require("mini.statusline").setup(status_line_config)
    require("mini.indentscope").setup()

    if vim.env.KITTY_SCROLLBACK_NVIM == "true" then
      vim.g.minitabline_disable = true
    end
    require("mini.tabline").setup({})
  end,
}
