---@type wk.Spec
return {
  -- <leader>b Prefix (Buffers extras)
  {
    "<leader>bb",
    "<cmd>e #<cr>",
    desc = "Switch to Other Buffer",
    mode = "n",
    icon = { icon = "󰘸 ", color = "blue" },
  },
  { "<leader>bd", "<cmd>bd<cr>", desc = "Delete Current Buffer", mode = "n", icon = { icon = "󰭌 ", color = "red" } },
}
