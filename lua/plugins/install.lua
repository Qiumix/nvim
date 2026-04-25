---
---Return full url of a github repo
---
---@param str string
---@return string
local function gh(str)
  return "https://github.com/" .. str
end

vim.pack.add({
  { src = gh("lumen-oss/lz.n") },
  { src = gh("nvim-lua/plenary.nvim") },
  { src = gh("MunifTanjim/nui.nvim") },

  { src = gh("mbbill/undotree") },
  { src = gh("mrcjkb/rustaceanvim") },
  { src = gh("karb94/neoscroll.nvim") },
  { src = gh("CopilotC-Nvim/CopilotChat.nvim") },
  { src = gh("nxhung2304/lastplace.nvim") },
  { src = gh("xemptuous/sqlua.nvim") },
  { src = gh("Qiumix/rime-toggle.nvim") },
  { src = gh("tonyfettes/fcitx5.nvim") },
  { src = gh("black-desk/fcitx5-ui.nvim") },

  { src = gh("lumen-oss/lz.n") },
  {
    src = gh("romus204/tree-sitter-manager.nvim"),
    version = "main",
  },
  {
    src = gh("nvim-treesitter/nvim-treesitter-textobjects"),
    version = "main",
  },

  { src = gh("rcarriga/nvim-notify") },

  { src = gh("ellisonleao/gruvbox.nvim") },
  { src = gh("chomosuke/typst-preview.nvim") },
  { src = gh("aznhe21/actions-preview.nvim") },
  { src = gh("nvim-telescope/telescope.nvim"), version = "0.1.8" },
  { src = gh("nvim-telescope/telescope-ui-select.nvim") },
  { src = gh("LinArcX/telescope-env.nvim") },
  { src = gh("wakatime/vim-wakatime") },
  { src = gh("L3MON4D3/LuaSnip") },
  { src = gh("rachartier/tiny-inline-diagnostic.nvim") },
  { src = gh("tris203/precognition.nvim") },
  { src = gh("nvzone/showkeys") },
  { src = gh("numToStr/FTerm.nvim") },
  { src = gh("neovim/nvim-lspconfig") },
  { src = gh("onsails/lspkind.nvim") },
  { src = gh("folke/noice.nvim") },
  { src = gh("folke/flash.nvim") },
  { src = gh("folke/which-key.nvim") },
  { src = gh("folke/lazydev.nvim") },
  { src = gh("folke/snacks.nvim") },
  { src = gh("folke/todo-comments.nvim") },
  { src = gh("3rd/image.nvim") },
  { src = gh("windwp/nvim-autopairs") },
  { src = gh("xzbdmw/colorful-menu.nvim") },
  { src = gh("saecki/crates.nvim") },
  { src = gh("mikesmithgh/kitty-scrollback.nvim") },
  { src = gh("ibhagwan/fzf-lua") },
  { src = gh("MeanderingProgrammer/render-markdown.nvim") },
  { src = gh("iamcco/markdown-preview.nvim") },
  { src = gh("SilverofLight/kd_translate.nvim") },
  { src = gh("sitiom/nvim-numbertoggle") },
  { src = gh("echasnovski/mini.nvim") },
  { src = gh("stevearc/conform.nvim") },
  { src = gh("xiyaowong/transparent.nvim") },
  { src = gh("lewis6991/gitsigns.nvim") },
  { src = gh("sindrets/diffview.nvim") },
  { src = gh("chentoast/marks.nvim") },
  {
    src = gh("saghen/blink.cmp"),
    version = vim.version.range("^1"),
  },
  {
    src = gh("mikavilpas/yazi.nvim"),
    version = vim.version.range("*"),
  },
  { src = gh("goolord/alpha-nvim") },
  { src = gh("gbprod/yanky.nvim") },
})
