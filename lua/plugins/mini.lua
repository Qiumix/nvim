vim.pack.add({
  { src = vim.g.gh_str("echasnovski/mini.surround") },
  { src = vim.g.gh_str("echasnovski/mini.statusline") },
  { src = vim.g.gh_str("echasnovski/mini.tabline") },
  { src = vim.g.gh_str("echasnovski/mini.icons") },
})

require("plugins.sub_mods.mini")
if not vim.g.vscode then
  require("plugins.sub_mods.mini_no_vsc")
end
