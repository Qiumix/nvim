---@type LznPackSpec
return {
  event = "BufReadPre",
  src = "nxhung2304/lastplace.nvim",
  after = function()
    require("lastplace").setup()
  end,
}
