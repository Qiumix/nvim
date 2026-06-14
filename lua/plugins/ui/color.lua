return {
  "nvim-colorizer.lua",
  after = function()
    require("colorizer").setup()
  end,
}
