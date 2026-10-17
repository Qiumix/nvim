-- misc keymap

---@module "which-key"
---@type wk.Spec
return {
  {
    "<leader>ml",
    function()
      local mc_ns = vim.api.nvim_create_namespace("nvim.multicursor")
      vim.api.nvim_buf_clear_namespace(0, mc_ns, 0, -1)
    end,
    desc = "Clears multicursors",
    mode = "n",
    icon = { icon = "󰗧 ", color = "purple" },
  },
}
