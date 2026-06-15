---@type lz.n.PluginSpec
return {
  "rime-toggle.nvim",
  event = "InsertEnter",
  after = function()
    require("rime_toggle").setup({ enabled = true })
  end,
}
