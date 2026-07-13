---@type wk.Spec
return {
  -- ════════════════════════════════════════════════════════════
  --  GROUPED MAPS (SUB-PATHS)
  -- ════════════════════════════════════════════════════════════
  { "[q", vim.cmd.cprev, desc = "Previous Quickfix", mode = "n", icon = { icon = "󰮳 ", color = "red" } },
  { "]q", vim.cmd.cnext, desc = "Next Quickfix", mode = "n", icon = { icon = "󰮱 ", color = "green" } },

  -- g Prefix (Goto & Helix Buffer Style)
  { "gl", "g$", desc = "Go to end of line", mode = { "n", "x", "o" }, icon = { icon = "󰘠 ", color = "grey" } },
  { "gh", "g^", desc = "Go to start of line", mode = { "n", "x", "o" }, icon = { icon = "󰘟 ", color = "grey" } },
  { "ge", "G", desc = "Go to end of file", mode = { "n", "x", "o" }, icon = { icon = "󰞒 ", color = "grey" } },
  { "go", "%", desc = "Jump to matching bracket", mode = { "n", "x", "o" }, icon = { icon = "󰅩 ", color = "grey" } },
  -- { "gd", vim.lsp.buf.definition, desc = "LSP Goto Definition", mode = "n", icon = { icon = "󰂺 ", color = "blue" } },

  {
    "gd",
    function()
      Snacks.picker.lsp_definitions()
    end,
    desc = "Goto Definition",
    mode = "n",
  },
  {
    "gD",
    function()
      Snacks.picker.lsp_declarations()
    end,
    desc = "Goto Declaration",
  },
  {
    "gr",
    function()
      Snacks.picker.lsp_references()
    end,
    nowait = true,
    desc = "References",
  },
  {
    "gI",
    function()
      Snacks.picker.lsp_implementations()
    end,
    desc = "Goto Implementation",
  },
  {
    "gy",
    function()
      Snacks.picker.lsp_type_definitions()
    end,
    desc = "Goto T[y]pe Definition",
  },
  {
    "gai",
    function()
      Snacks.picker.lsp_incoming_calls()
    end,
    desc = "C[a]lls Incoming",
  },
  {
    "gao",
    function()
      Snacks.picker.lsp_outgoing_calls()
    end,
    desc = "C[a]lls Outgoing",
  },

  { "K", vim.lsp.buf.hover, desc = "LSP Hover", mode = "n", icon = { icon = "󰇮 ", color = "blue" } },
  { "gn", "<cmd>bnext<CR>", desc = "Next buffer", mode = "n", icon = { icon = "󰮱 ", color = "azure" } },
  { "gp", "<cmd>bprevious<CR>", desc = "Previous buffer", mode = "n", icon = { icon = "󰮳 ", color = "azure" } },

  -- Alt-based Navigation
  { "<A-h>", "^", desc = "Go to start of line", mode = { "n", "x", "o" }, icon = { icon = "󰘟 ", color = "grey" } },
  { "<A-l>", "$", desc = "Go to end of line", mode = { "n", "x", "o" }, icon = { icon = "󰘠 ", color = "grey" } },

  -- z Prefix (Fold controls)
  {
    "zv",
    "zMzvzz",
    desc = "Close all folds except the current one",
    mode = "n",
    icon = { icon = "󰘖 ", color = "grey" },
  },
}
