---@type wk.Spec
return {
  -- ════════════════════════════════════════════════════════════
  --  MERGED GLOBAL & ROOT KEYMAPS
  -- ════════════════════════════════════════════════════════════
  -- Root Movements (Normal Mode)
  { "<C-I>", "<C-I>", desc = "Jump forward in jumplist", mode = "n", icon = { icon = "󰜴 ", color = "blue" } },
  { "n", "nzzzv", desc = "Next search match", mode = "n", icon = { icon = "󰮰 ", color = "azure" } },
  { "N", "Nzzzv", desc = "Prev search match", mode = "n", icon = { icon = "󰮲 ", color = "azure" } },

  -- Buffer Navigation & Management
  { "<Tab>", "<cmd>bnext<cr>", desc = "Next Buffer", mode = "n", icon = { icon = "󰮱 ", color = "azure" } },
  { "<S-Tab>", "<cmd>bprevious<cr>", desc = "Prev Buffer", mode = "n", icon = { icon = "󰮳 ", color = "azure" } },
  { "<A-d>", "<cmd>bd<cr>", desc = "Delete Current Buffer", mode = "n", icon = { icon = "󰭌 ", color = "red" } },

  -- Multi-mode Window & Terminal UI
  {
    "<esc>",
    "<cmd>nohlsearch<cr><esc>",
    desc = "Escape and Clear hlsearch",
    mode = { "i", "n" },
    icon = { icon = "󱊷 ", color = "grey" },
  },
  {
    "<A-i>",
    '<CMD>lua require("FTerm").toggle()<CR>',
    desc = "Toggle Fterm",
    mode = "n",
    icon = { icon = "󰆍 ", color = "green" },
  },
  {
    "<A-i>",
    '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>',
    desc = "Toggle Fterm",
    mode = "t",
    icon = { icon = "󰆍 ", color = "green" },
  },

  -- Smart Visual j/k Movements
  {
    "j",
    "v:count == 0 ? 'gj' : 'j'",
    desc = "Down",
    mode = { "n", "x" },
    expr = true,
    silent = true,
    icon = { icon = "󰜮 ", color = "grey" },
  },
  {
    "k",
    "v:count == 0 ? 'gk' : 'k'",
    desc = "Up",
    mode = { "n", "x" },
    expr = true,
    silent = true,
    icon = { icon = "󰜷 ", color = "grey" },
  },
  {
    "<Down>",
    "v:count == 0 ? 'gj' : 'j'",
    desc = "Down",
    mode = { "n", "x" },
    expr = true,
    silent = true,
    icon = { icon = "󰜮 ", color = "grey" },
  },
  {
    "<Up>",
    "v:count == 0 ? 'gk' : 'k'",
    desc = "Up",
    mode = { "n", "x" },
    expr = true,
    silent = true,
    icon = { icon = "󰜷 ", color = "grey" },
  },

  -- VSCode Line Swapping (Alt+j/k)
  {
    "<A-j>",
    "<cmd>execute 'move .+' . v:count1<cr>==",
    desc = "Move Line Down",
    mode = "n",
    icon = { icon = "󰜮 ", color = "grey" },
  },
  {
    "<A-k>",
    "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==",
    desc = "Move Line Up",
    mode = "n",
    icon = { icon = "󰜷 ", color = "grey" },
  },
  {
    "<A-j>",
    "<esc><cmd>m .+1<cr>==gi",
    desc = "Move Line Down",
    mode = "i",
    icon = { icon = "󰜮 ", color = "grey" },
  },
  {
    "<A-k>",
    "<esc><cmd>m .-2<cr>==gi",
    desc = "Move Line Up",
    mode = "i",
    icon = { icon = "󰜷 ", color = "grey" },
  },
  {
    "<A-j>",
    ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv",
    desc = "Move Selection Down",
    mode = "x",
    icon = { icon = "󰜮 ", color = "grey" },
  },
  {
    "<A-k>",
    ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv",
    desc = "Move Selection Up",
    mode = "x",
    icon = { icon = "󰜷 ", color = "grey" },
  },

  -- Visual Editing Core
  { "<", "<gv", desc = "Indent left and keep selection", mode = "x", icon = { icon = "󰉵 ", color = "grey" } },
  { ">", ">gv", desc = "Indent right and keep selection", mode = "x", icon = { icon = "󰉶 ", color = "grey" } },
  {
    "p",
    "_dP",
    desc = "Smart paste without overwriting register",
    mode = "v",
    expr = true,
    silent = true,
    icon = { icon = "󰆒 ", color = "green" },
  },

  -- Insert Mode Break-points
  { ",", ",<c-g>u", desc = "Undo break point (,)", mode = "i", icon = { icon = "󰕌 ", color = "grey" } },
  { ".", ".<c-g>u", desc = "Undo break point (.)", mode = "i", icon = { icon = "󰕌 ", color = "grey" } },
  { ";", ";<c-g>u", desc = "Undo break point (;)", mode = "i", icon = { icon = "󰕌 ", color = "grey" } },
}
