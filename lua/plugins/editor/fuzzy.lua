---@type lz.n.PluginSpec
return {
  {
    "tv.nvim",
    cmd = "Tv",
    after = function()
      require("tv").setup({})
    end,
  },
}
