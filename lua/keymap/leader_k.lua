---@type wk.Spec
return {
  -- <leader>k Prefix (Translation)
  {
    "<leader>k",
    "<cmd>TranslateNormal<CR>",
    desc = "Translate word",
    mode = "n",
    icon = { icon = "󰗊 ", color = "orange" },
  },
  {
    "<leader>k",
    "<cmd>TranslateVisual<CR>",
    desc = "Translate select",
    mode = "x",
    icon = { icon = "󰗊 ", color = "orange" },
  },
  {
    "<leader>K",
    "<cmd>Translate<CR>",
    desc = "Translation",
    mode = "n",
    silent = true,
    icon = { icon = "󰖶 ", color = "cyan" },
  },
  {
    "<leader>K",
    ":Translate<CR>",
    desc = "Translation",
    mode = "v",
    silent = true,
    icon = { icon = "󰖶 ", color = "cyan" },
  },
}
