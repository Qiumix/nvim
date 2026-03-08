require('config.keymaps.normal')
require('config.keymaps.man')
require('config.keymaps.log')
require('config.keymaps.conform')
if vim.g.vscode then
  require('config.keymaps.vscode')
end
