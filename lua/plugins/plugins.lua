---Return full url of a github repo
---
---@param repo_addr string
---@return string
local function github_prefix(repo_addr)
  return "https://github.com/" .. repo_addr
end

local plugins = {
  { src = "lumen-oss/lz.n" },
  { src = "nvim-lua/plenary.nvim" },
  { src = "MunifTanjim/nui.nvim" },

  { src = "mrcjkb/rustaceanvim" },
  { src = "karb94/neoscroll.nvim" },
  { src = "CopilotC-Nvim/CopilotChat.nvim" },
  { src = "nxhung2304/lastplace.nvim" },
  { src = "xemptuous/sqlua.nvim" },
  { src = "Qiumix/rime-toggle.nvim" },
  { src = "lukas-reineke/indent-blankline.nvim" },
  { src = "alexpasmantier/tv.nvim" },
  { src = "lumen-oss/lz.n" },
  { src = "lewis6991/gitsigns.nvim" },
  {
    src = "romus204/tree-sitter-manager.nvim",
    version = "main",
  },
  {
    src = "nvim-treesitter/nvim-treesitter-textobjects",
    version = "main",
  },
  { src = "ellisonleao/gruvbox.nvim" },
  { src = "chomosuke/typst-preview.nvim" },
  { src = "aznhe21/actions-preview.nvim" },
  { src = "wakatime/vim-wakatime" },
  {
    src = "L3MON4D3/LuaSnip",
    version = vim.version.range("^2"),
    load = function() end,
  },
  { src = "rachartier/tiny-inline-diagnostic.nvim" },
  { src = "tris203/precognition.nvim" },
  { src = "nvzone/showkeys" },
  { src = "numToStr/FTerm.nvim" },
  { src = "mfussenegger/nvim-dap" },
  { src = "nvim-neotest/nvim-nio" },
  { src = "rcarriga/nvim-dap-ui" },
  { src = "theHamsta/nvim-dap-virtual-text" },
  { src = "neovim/nvim-lspconfig" },
  { src = "folke/flash.nvim" },
  { src = "folke/which-key.nvim" },
  { src = "folke/lazydev.nvim" },
  { src = "folke/snacks.nvim" },
  { src = "3rd/image.nvim" },
  { src = "xzbdmw/colorful-menu.nvim" },
  { src = "saecki/crates.nvim" },
  { src = "mikesmithgh/kitty-scrollback.nvim" },
  { src = "MeanderingProgrammer/render-markdown.nvim" },
  { src = "SilverofLight/kd_translate.nvim" },
  { src = "sitiom/nvim-numbertoggle" },

  { src = "echasnovski/mini.nvim", name = "mini.nvim" },
  { src = "echasnovski/mini.nvim", name = "mini.editor" },
  { src = "echasnovski/mini.nvim", name = "mini.ui" },
  { src = "echasnovski/mini.starter" },
  { src = "echasnovski/mini.pair" },
  { src = "echasnovski/mini.ai" },
  { src = "echasnovski/mini.icon" },

  { src = "stevearc/conform.nvim" },
  { src = "sindrets/diffview.nvim" },
  { src = "chentoast/marks.nvim" },
  {
    src = "saghen/blink.cmp",
    version = vim.version.range("^1"),
  },
  {
    src = "mikavilpas/yazi.nvim",
    version = vim.version.range("*"),
  },
  { src = "gbprod/yanky.nvim" },
}

for _, plugin in ipairs(plugins) do
  plugin.src = github_prefix(plugin.src)
end

return plugins
