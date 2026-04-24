vim.api.nvim_create_autocmd("FileType", {
  pattern = "man",
  callback = function()
    vim.keymap.set('n', 'd', '<C-d>', { buffer = true, noremap = true })
    vim.keymap.set('n', 'u', '<C-u>', { buffer = true, noremap = true })
    vim.opt.wrap = true           -- Don't wrap lines
    vim.opt.number = true         -- Line numbers
    vim.opt.relativenumber = true -- Relative line numbers
    vim.opt_local.timeoutlen = 0
  end,
})
