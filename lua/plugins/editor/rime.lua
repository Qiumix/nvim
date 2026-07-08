---@type LznPackSpec
return {
  src = "Qiumix/rime-toggle.nvim",
  event = "InsertEnter",
  after = function()
    require("rime_toggle").setup({ enabled = true })
  end,
}
