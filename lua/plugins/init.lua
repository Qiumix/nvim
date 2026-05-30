local plugins = require("plugins.plugins")
vim.pack.add(plugins)

local lzn = require("lz.n")

lzn.load("plugins.mini")
lzn.load("plugins.editor")
lzn.load("plugins.ui")
lzn.load("plugins.langs")

vim.cmd("colorscheme gruvbox")
