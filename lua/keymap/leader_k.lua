---@type wk.Spec
return {
  -- <leader>k Prefix (Translation)
  {
    "<leader>k",
    ":TranslateNormal<CR>",
    desc = "Translate word",
    mode = "n",
    icon = { icon = "󰎚 ", color = "orange" },
  },
  {
    "<leader>k",
    ":TranslateVisual<CR>",
    desc = "Translate select",
    mode = "x",
    icon = { icon = "󰎚 ", color = "orange" },
  },
}
