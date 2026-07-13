---@type wk.Spec
return {
  -- <leader>e Prefix (Explorer)
  { "<leader>e", "<cmd>Yazi<CR>", desc = "Yazi", mode = "n", icon = { icon = "󰉋 ", color = "green" } },
  {
    "<leader>E",
    function()
      require("oil").toggle_float()
    end,
    desc = "Oil",
    mode = "n",
    icon = { icon = "󰝰 ", color = "green" },
  },
}
