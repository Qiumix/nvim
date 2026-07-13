---@type LznPackSpec
return {
  {
    src = "alexpasmantier/tv.nvim",
    enabled = false,
    cmd = "Tv",
    after = function()
      require("tv").setup({})
    end,
  },
}
