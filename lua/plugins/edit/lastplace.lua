return {
  "nxhung2304/lastplace.nvim",
  event = "BufReadPre",
  config = function()
    require("lastplace").setup()
  end,
}