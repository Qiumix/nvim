return {
  "mini.nvim",
  after = function()
    require("mini.fuzzy").setup()
  end,
}
