---@type lz.n.PluginSpec
return {
  "rime-toggle.nvim",
  lazy = false,
  after = function()
    require("rime_toggle").setup({ enabled = true })
  end,
}
