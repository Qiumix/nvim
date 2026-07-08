---@type LznPackSpec
return {
  src = "nxhung2304/lastplace.nvim",
  after = function()
    require("lastplace").setup()
  end,
}
