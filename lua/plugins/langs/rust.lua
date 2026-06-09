---@type lz.n.PluginSpec
return {
  "crates.nvim",
  ft = "toml",
  after = function()
    require("crates").setup()
  end,
}
