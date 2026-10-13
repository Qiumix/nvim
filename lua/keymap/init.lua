---@type wk.Spec
local M = {}

local modules = {
  "keymap.groups",
  "keymap.surround",
  "keymap.textobjects",
  "keymap.common",
  "keymap.better",
  "keymap.leader_tab",
  "keymap.leader_b",
  "keymap.leader_t",
  "keymap.leader_l",
  "keymap.leader_q",
  "keymap.leader_o",
  "keymap.leader_k",
  "keymap.leader_e",
  "keymap.leader_s",
  "keymap.leader_g",
  "keymap.leader_w",
}

for _, name in ipairs(modules) do
  vim.list_extend(M, require(name))
end

return M
