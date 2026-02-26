local map = vim.keymap.set
vim.keymap.set('n', '<leader>uf', function()
  auto_format = not auto_format
  if auto_format then
    vim.cmd('FormatEnable')
  else
    vim.cmd('FormatDisable')
  end
end, { desc = 'Toggle Autoformat' })

vim.keymap.set({ 'n', 'v' }, '<leader>cn', '<cmd>ConformInfo<cr>', { desc = 'Conform Info' })

vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
  require('conform').format({ async = true }, function(err, did_edit)
    if not err and did_edit then
      vim.notify('Code formatted', vim.log.levels.INFO, { title = 'Conform' })
    end
  end)
end, { desc = 'Format buffer' })

vim.keymap.set({ 'n', 'v' }, '<leader>cF', function()
  require('conform').format({ formatters = { 'injected' }, timeout_ms = 3000 })
end, { desc = 'Format Injected Langs' })
