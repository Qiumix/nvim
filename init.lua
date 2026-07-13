vim.pack.add({ { src = "https://github.com/zuqini/zpack.nvim" } }, { confirm = false })
require("zpack").setup({
  spec = {
    { import = "plugins" },
  },
  defaults = {
    lazy = true,
  },
})

require("utils")
Load("core")
vim.cmd(":colorscheme gruvbox")
