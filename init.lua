vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Bootstrap zpack.nvim
vim.pack.add({ { src = "https://github.com/zuqini/zpack.nvim" } }, { confirm = false })

-- Setup zpack
require("zpack").setup({
  spec = {
    { import = "plugins/code" },
    { import = "plugins/completion" },
    { import = "plugins/deps" },
    { import = "plugins/edit" },
    { import = "plugins/file" },
    { import = "plugins/langs" },
    { import = "plugins/mini" },
    { import = "plugins/tool" },
    { import = "plugins/ui" },
  },
  defaults = {
    lazy = true,
  },
})

require("utils")

-- Load core configs directly
Load("core")

vim.cmd(":colorscheme gruvbox")
