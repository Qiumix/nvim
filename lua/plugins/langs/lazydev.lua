return {
  "lazydev.nvim",
  lazy = true,
  ft = "lua",
  cmd = "LazyDev",
  opts = {
    library = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      { path = "snacks.nvim", words = { "Snacks" } },
      { path = "mini.icons", words = { "MiniIcon" } },
    },
  },
  after = function()
    require("lazydev").setup()
  end,
}
