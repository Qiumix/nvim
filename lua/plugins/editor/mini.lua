require('mini.surround').setup()
if not vim.g.vscode then
  require('mini.statusline').setup()
  require('mini.tabline').setup()
  require('mini.icons').setup()
  -- require('mini.cmdline').setup({})
  require('mini.cursorword').setup({
    delay = 0
  })
end
