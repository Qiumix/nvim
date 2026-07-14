vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.pack.add({ { src = "https://github.com/zuqini/zpack.nvim" } })

require("zpack").setup({
  defaults = {
    confirm = false,
    lazy = true,
  },
})

require("core.autocmd")
require("core.lsp")
require("core.options")
require("core.usercmd")

vim.cmd(":colorscheme gruvbox")
