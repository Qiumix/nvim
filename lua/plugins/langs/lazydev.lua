---@type lz.n.Spec
return {
  "lazydev.nvim",
  ft = "lua",
  after = function()
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
