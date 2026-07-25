---@type wk.Spec
local M = {}

local function merge_specs(...)
  local result = {}
  for _, spec in ipairs({ ... }) do
    for _, item in ipairs(spec) do
      table.insert(result, item)
    end
  end
  return result
end

local groups = require("keymap.groups")
local surround = require("keymap.surround")
local textobjects = require("keymap.textobjects")
local common = require("keymap.common")
local better = require("keymap.better")
local leader_tab = require("keymap.leader_tab")
local leader_b = require("keymap.leader_b")
local leader_t = require("keymap.leader_t")
local leader_l = require("keymap.leader_l")
local leader_q = require("keymap.leader_q")
local leader_o = require("keymap.leader_o")
local leader_k = require("keymap.leader_k")
local leader_e = require("keymap.leader_e")
local leader_s = require("keymap.leader_s")
local leader_g = require("keymap.leader_g")
local leader_w = require("keymap.leader_w")
local leader_d = require("keymap.leader_d")

M = merge_specs(
  groups,
  surround,
  textobjects,
  common,
  better,
  leader_tab,
  leader_b,
  leader_t,
  leader_l,
  leader_q,
  leader_o,
  leader_k,
  leader_e,
  leader_s,
  leader_g,
  leader_w,
  leader_d
)

return M
