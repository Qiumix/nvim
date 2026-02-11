vim.pack.add({
  { src = vim.g.gh('goolord/alpha-nvim') }
})
local alpha = require('alpha')
local dashboard = require("alpha.themes.dashboard")
local start_art = require("plugins.start_art")
dashboard.section.header.val = start_art[1]
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
  return vim.g.startup_time_ms or "[[  ]]"
end

dashboard.section.buttons.opts.hl = "Keyword"
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
