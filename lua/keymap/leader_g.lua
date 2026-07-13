---@type wk.Spec
return {
  -- <leader>g Prefix (Git - gitsigns)
  { "<leader>gp", desc = "Preview hunk", mode = "n", icon = { icon = "󰶯 ", color = "cyan" } },
  { "<leader>gi", desc = "Preview hunk inline", mode = "n", icon = { icon = "󰶯 ", color = "cyan" } },
  { "<leader>gb", desc = "Blame line", mode = "n", icon = { icon = "󰦖 ", color = "orange" } },
  { "<leader>gd", desc = "Git diff", mode = "n", icon = { icon = " ", color = "purple" } },
  { "<leader>gD", desc = "Git diff ~", mode = "n", icon = { icon = " ", color = "purple" } },
  { "<leader>gl", desc = "Git quickfix list", mode = "n", icon = { icon = "󰁨 ", color = "azure" } },
  { "<leader>gL", desc = "Git quickfix list all", mode = "n", icon = { icon = "󰁨 ", color = "azure" } },
  { "<leader>gS", desc = "Toggle buffer stage", mode = "n", icon = { icon = "󰊢 ", color = "green" } },
  { "<leader>gR", desc = "Buffer reset", mode = "n", icon = { icon = "󰁯 ", color = "red" } },
  { "<leader>gs", desc = "Toggle hunk stage", mode = { "n", "v" }, icon = { icon = "󰊢 ", color = "green" } },
  { "<leader>gr", desc = "Hunk reset", mode = { "n", "v" }, icon = { icon = "󰁯 ", color = "red" } },
  { "<leader>tb", desc = "Toggle git line blame", mode = "n", icon = { icon = "󰦖 ", color = "orange" } },
  { "<leader>tW", desc = "Toggle word diff", mode = "n", icon = { icon = "󰩏 ", color = "cyan" } },
  { "ih", desc = "Git hunk", mode = { "o", "x" }, icon = { icon = "󰊢 ", color = "purple" } },
}
