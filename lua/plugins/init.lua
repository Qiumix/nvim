require("plugins.install")

local lzn = require("lz.n")

lzn.load("plugins.git")
lzn.load("plugins.editor")
lzn.load("plugins.ui")
lzn.load("plugins.nolazy")
lzn.load("plugins.langs")

vim.cmd("colorscheme gruvbox")
