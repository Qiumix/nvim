---@type wk.Spec
return {
  -- <leader><tab> Prefix (Tabs)
  {
    "<leader><tab><tab>",
    "<cmd>tabnew<cr>",
    desc = "New Tab",
    mode = "n",
    icon = { icon = "󰝜 ", color = "blue" },
  },
  { "<leader><tab>]", "<cmd>tabnext<cr>", desc = "Next Tab", mode = "n", icon = { icon = "󰅂 ", color = "azure" } },
  {
    "<leader><tab>[",
    "<cmd>tabprevious<cr>",
    desc = "Previous Tab",
    mode = "n",
    icon = { icon = "󰅁 ", color = "azure" },
  },
  {
    "<leader><tab>f",
    "<cmd>tabfirst<cr>",
    desc = "First Tab",
    mode = "n",
    icon = { icon = "󰘀 ", color = "azure" },
  },
  { "<leader><tab>l", "<cmd>tablast<cr>", desc = "Last Tab", mode = "n", icon = { icon = "󰘁 ", color = "azure" } },
  {
    "<leader><tab>o",
    "<cmd>tabonly<cr>",
    desc = "Close Other Tabs",
    mode = "n",
    icon = { icon = "󰭌 ", color = "red" },
  },
  { "<leader><tab>d", "<cmd>tabclose<cr>", desc = "Close Tab", mode = "n", icon = { icon = "󰭌 ", color = "red" } },
}
