---@type LznPackSpec
return {
  {
    src = "alexpasmantier/tv.nvim",
    cmd = "Tv",
    after = function()
      require("tv").setup({})
    end,
  },
}
