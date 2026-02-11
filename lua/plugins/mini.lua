vim.pack.add({
  { src = vim.g.gh_str("echasnovski/mini.nvim") },
})

require("plugins.sub_mods.mini")
if not vim.g.vscode then
  require("plugins.sub_mods.mini_no_vsc")
end
