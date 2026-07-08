---@type LznPackSpec
return {
  src = "saecki/crates.nvim",
  ft = "toml",
  after = function()
    require("crates").setup()
  end,
}
