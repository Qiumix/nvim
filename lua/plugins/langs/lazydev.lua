---@type lz.n.PluginSpec
return {
  "lazydev.nvim",
  ft = "lua",
  lazy = false,
  after = function()
    require("lazydev").setup({
      library = {
        { path = "~/.local/share/nvim/site/pack/core/opt/lz.n", words = { "lz.n" } },
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    })
  end,
}
