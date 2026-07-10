vim.api.nvim_create_user_command("Qb", "q!", {
  desc = "Force quit current window",
})

vim.api.nvim_create_user_command("Qwb", "wq!", {
  desc = "Force write and quit current window",
})
