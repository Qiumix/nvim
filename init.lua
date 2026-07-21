vim.pack.add({ { src = "https://github.com/zuqini/zpack.nvim" } })
vim.g.mapleader = " " -- <Space> as leader key
vim.g.maplocalleader = "," -- <,> as local leader (used by grug-far etc.)

require("zpack").setup(
  ---@module "zpack"
  ---@type zpack.Config
  {
    defaults = {
      confirm = false,
      lazy = true,
    },
    -- profiling = {
    --   loader = true,
    --   require = true,
    -- },
  }
)

require("core.autocmd")
require("core.lsp")
require("core.options")
require("core.usercmd")

vim.cmd(":colorscheme gruvbox")
