---@type lz.n.Spec
return {
  {
    "tv.nvim",
    cmd = "Tv",
    after = function()
      require("tv").setup({})
    end,
  },
}
