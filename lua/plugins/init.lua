require("plugins.install")

local lzn = require("lz.n")

lzn.load("plugins.git")
lzn.load("plugins.editor")
lzn.load("plugins.langs")
lzn.load("plugins.ui")

require("plugins.nolazy")

vim.cmd("colorscheme gruvbox")
