---@module "zpack"
---@type zpack.Spec|zpack.Spec[]
return {
  {
    "saecki/crates.nvim",
    ft = "toml",
    config = function()
      require("crates").setup({})
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    enabled = false,
    ft = "rust",
    config = function()
      vim.g.rustaceanvim = {}
    end,
  },
}
