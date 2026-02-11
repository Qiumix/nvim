vim.pack.add({
  { src = vim.g.gh_str('goolord/alpha-nvim') }
})
local alpha = require('alpha')
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {


  [[  ^  ^  ^   ^☆ ★ ☆ ___I_☆ ★ ☆ ^  ^   ^  ^  ^   ^  ^ ]],
  [[ /|\/|\/|\ /|\ ★☆ /\-_--\ ☆ ★/|\/|\ /|\/|\/|\ /|\/|\ ]],
  [[ /|\/|\/|\ /|\ ★ /  \_-__\☆ ★/|\/|\ /|\/|\/|\ /|\/|\ ]],
  [[ /|\/|\/|\ /|\ 󰻀 |[]| [] | 󰻀 /|\/|\ /|\/|\/|\ /|\/|\ ]],
}

dashboard.section.buttons.val = {
  dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "󰍉  Find file", ":lua require('fzf-lua').files() <CR>"),
  dashboard.button("e", "  Browse cwd", ":Yazi<CR>"),
  dashboard.button("r", "  Browse src", ":e ~/.local/src/<CR>"),
  dashboard.button("s", "󰯂  Browse scripts", ":e ~/scripts/<CR>"),
  dashboard.button("c", "  Config", ":e ~/.config/nvim/<CR>"),
  dashboard.button("m", "  Keymaps", ":e ~/.config/nvim/lua/config/keymaps.lua<CR>"),
  dashboard.button("q", "󰅙  Quit", ":q!<CR>"),
}

dashboard.section.footer.val = function()
  return vim.g.startup_time_ms or "[[  ]]"
end

dashboard.section.buttons.opts.hl = "Keyword"
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
