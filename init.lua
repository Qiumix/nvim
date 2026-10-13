-- cache byte code to speed up
vim.loader.enable()

-- load package manager
vim.pack.add({ { src = "https://github.com/zuqini/zpack.nvim" } })

-- built-in neovim options
require("core.options")

-- auto command
require("core.autocmd")

-- setup plugin loading
require("zpack").setup({ defaults = { lazy = true } })
