---@type wk.Spec
return {
  -- <leader>o Prefix (System Control Hooks)
  { "<leader>oo", "<cmd>source<CR>", desc = "Source file", mode = "n", icon = { icon = "󰓦 ", color = "cyan" } },
  { "<leader>or", "<cmd>restart<CR>", desc = "Restart", mode = "n", icon = { icon = "󰜉 ", color = "red" } },
}
