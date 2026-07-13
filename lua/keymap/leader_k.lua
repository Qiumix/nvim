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
}
