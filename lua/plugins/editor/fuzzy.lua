return {
  ---@type lz.n.PluginSpec
  {
    "tv.nvim",
    cmd = "Tv",
    after = function()
      require("tv").setup({})
    end,
  },
}
