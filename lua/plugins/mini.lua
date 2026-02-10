vim.pack.add({
  { src = vim.g.gh_str("echasnovski/mini.surround") },
})

require("plugins.sub_mods.mini")
if vim.g.vscode then
  require("plugins.sub_mods.mini_vsc")
end
