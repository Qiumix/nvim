---@type LznPackSpec
return {
  src = "Qiumix/rime-toggle.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("rime_toggle").setup()
  end,
}
