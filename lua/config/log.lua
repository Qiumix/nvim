vim.api.nvim_create_autocmd("FileType", {
  pattern = "log",
  callback = function()
    vim.keymap.set('n', 'd', '<C-d>', { buffer = true, noremap = true })
    vim.keymap.set('n', 'u', '<C-u>', { buffer = true, noremap = true })
    vim.opt_local.timeoutlen = 0
  end,
})
