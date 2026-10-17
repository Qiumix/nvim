---@module "which-key"
---@type wk.Spec
local M = {}

local modules = {
  "keymap.better", -- better than default
  "keymap.common", -- misc
  "keymap.groups", -- keymap groups for whichkey
  "keymap.leader.b", -- buffer
  "keymap.leader.e", -- explorer(yazi)
  "keymap.leader.g", -- git
  "keymap.leader.k", -- kd translate
  "keymap.leader.l", -- language
  "keymap.leader.m", -- language
  "keymap.leader.o", -- neovim system control
  "keymap.leader.q", -- quit
  "keymap.leader.s", -- snack pick
  "keymap.leader.tab", -- tab management
  "keymap.leader.t", -- toggle
  "keymap.leader.w", -- window management
  "keymap.surround", -- surround
  "keymap.textobjects", -- textobjects
}

for _, name in ipairs(modules) do
  vim.list_extend(M, require(name))
end

return M
