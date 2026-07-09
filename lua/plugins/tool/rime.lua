---@type LznPackSpec
return {
  src = "Qiumix/rime-toggle.nvim",
  after = function()
    require("rime_toggle").setup()
  end,
}
