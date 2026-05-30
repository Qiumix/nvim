---@type lz.n.PluginSpec
return {
  "lastplace.nvim",
  after = function()
    require("lastplace").setup()
  end,
}
