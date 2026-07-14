---@module "zpack"
---@type zpack.Spec
return {
  "folke/lazydev.nvim",
  ft = "lua",
  config = function()
    require("lazydev").setup({
      library = {
        "nvim-dap-ui",
        "which-key.nvim",
        { path = "lz.n", words = { "lz.n" } },
        { path = "snacks.nvim", words = { "Snacks" } },
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    })
  end,
}
