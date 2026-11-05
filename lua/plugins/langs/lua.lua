---@module "zpack"
---@type zpack.Spec | zpack.Spec[]
return {
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
