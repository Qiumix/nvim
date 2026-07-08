---@type LznPackSpec
return {
  src = "Qiumix/rime-toggle.nvim",
  lazy = false,
  after = function()
    require("rime_toggle").setup()
  end,
}
