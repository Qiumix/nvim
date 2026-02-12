vim.pack.add({
  { src = gh("echasnovski/mini.nvim") },
})

require("mini.surround").setup()
if not vim.g.vscode then
  require("mini.statusline").setup()
  require("mini.tabline").setup()
  require("mini.icons").setup()
end
