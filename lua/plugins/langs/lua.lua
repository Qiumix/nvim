---@module "zpack"
---@type zpack.Spec | zpack.Spec[]
return {
  { "ii14/emmylua-nvim", ft = "lua" },
  {
    "qiumix/emmylua_ls_bridge.nvim",
    ft = "lua",
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua",
      event = "VeryLazy",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
}
