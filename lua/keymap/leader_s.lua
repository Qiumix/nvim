---@type wk.Spec
return {
  -- <leader>s Prefix (Search with Snacks Picker)
  {
    "<leader>ss",
    function()
      Snacks.picker.grep()
    end,
    desc = "Smart Find Files",
    mode = "n",
    icon = { icon = "󰍉 ", color = "yellow" },
  },
  {
    "<leader>sf",
    function()
      Snacks.picker.smart()
    end,
    desc = "Find Files",
    mode = "n",
    icon = { icon = "󰈔 ", color = "cyan" },
  },
  {
    "<leader>sl",
    function()
      Snacks.picker.lines()
    end,
    desc = "Visual selection or word",
    mode = { "n", "x" },
    icon = { icon = "󰦨 ", color = "green" },
  },
  {
    "<leader>sb",
    function()
      Snacks.picker.buffers()
    end,
    desc = "Buffers",
    mode = "n",
    icon = { icon = "󰈙 ", color = "blue" },
  },
  {
    "<leader>sh",
    function()
      Snacks.picker.help()
    end,
    desc = "Help Pages",
    mode = "n",
    icon = { icon = "󰇘 ", color = "green" },
  },
  {
    "<leader>sk",
    function()
      Snacks.picker.keymaps()
    end,
    desc = "Keymaps",
    mode = "n",
    icon = { icon = "󰌌 ", color = "purple" },
  },
  {
    "<leader>sc",
    function()
      Snacks.picker.commands()
    end,
    desc = "Commands",
    mode = "n",
    icon = { icon = "󰘳 ", color = "orange" },
  },
  {
    "<leader>sC",
    function()
      Snacks.picker.command_history()
    end,
    desc = "Command History",
    mode = "n",
    icon = { icon = "󰘳 ", color = "orange" },
  },
  {
    "<leader>sd",
    function()
      Snacks.picker.diagnostics()
    end,
    desc = "Diagnostics",
    mode = "n",
    icon = { icon = "󰀦 ", color = "red" },
  },
  {
    "<leader>sD",
    function()
      Snacks.picker.diagnostics_buffer()
    end,
    desc = "Buffer Diagnostics",
    mode = "n",
    icon = { icon = "󰀦 ", color = "red" },
  },
  {
    "<leader>sr",
    function()
      Snacks.picker.resume()
    end,
    desc = "Resume",
    mode = "n",
    icon = { icon = "󰑓 ", color = "purple" },
  },
  {
    "<leader>s.",
    function()
      Snacks.picker.recent()
    end,
    desc = "Recent Files",
    mode = "n",
    icon = { icon = "󰈔 ", color = "cyan" },
  },
  {
    "<leader>sp",
    function()
      Snacks.picker.projects()
    end,
    desc = "Projects",
    mode = "n",
    icon = { icon = "󰉋 ", color = "green" },
  },
  {
    "<leader>sm",
    function()
      Snacks.picker.marks()
    end,
    desc = "Marks",
    mode = "n",
    icon = { icon = "󰍎 ", color = "purple" },
  },
  {
    "<leader>sj",
    function()
      Snacks.picker.jumps()
    end,
    desc = "Jumps",
    mode = "n",
    icon = { icon = "󰮱 ", color = "blue" },
  },
  {
    "<leader>sq",
    function()
      Snacks.picker.qflist()
    end,
    desc = "Quickfix List",
    mode = "n",
    icon = { icon = "󰁨 ", color = "azure" },
  },
  {
    "<leader>su",
    function()
      Snacks.picker.undo()
    end,
    desc = "Undo History",
    mode = "n",
    icon = { icon = "󰦛 ", color = "orange" },
  },
  {
    "<leader>sR",
    function()
      Snacks.picker.registers()
    end,
    desc = "Registers",
    mode = "n",
    icon = { icon = "󰏪 ", color = "purple" },
  },
  {
    "<leader>s/",
    function()
      Snacks.picker.search_history()
    end,
    desc = "Search History",
    mode = "n",
    icon = { icon = "󰍉 ", color = "yellow" },
  },
  {
    "<leader>s,",
    function()
      Snacks.picker.lsp_symbols()
    end,
    desc = "LSP Symbols",
    mode = "n",
    icon = { icon = "󱔁 ", color = "cyan" },
  },
  {
    "<leader>s<",
    function()
      Snacks.picker.lsp_workspace_symbols()
    end,
    desc = "LSP Workspace Symbols",
    mode = "n",
    icon = { icon = " ", color = "blue" },
  },
  {
    "<leader>sa",
    function()
      Snacks.picker.autocmds()
    end,
    desc = "Autocmds",
    mode = "n",
    icon = { icon = "󰘳 ", color = "green" },
  },
  {
    "<leader>sH",
    function()
      Snacks.picker.highlights()
    end,
    desc = "Highlights",
    mode = "n",
    icon = { icon = "󰏘 ", color = "cyan" },
  },
  {
    "<leader>si",
    function()
      Snacks.picker.icons()
    end,
    desc = "Icons",
    mode = "n",
    icon = { icon = "󰏘 ", color = "purple" },
  },
  {
    "<leader>sM",
    function()
      Snacks.picker.man()
    end,
    desc = "Man Pages",
    mode = "n",
    icon = { icon = " ", color = "green" },
  },
  {
    "<leader>sS",
    function()
      Snacks.picker.colorschemes()
    end,
    desc = "Colorschemes",
    mode = "n",
    icon = { icon = "󰏘 ", color = "orange" },
  },
  -- Git
  {
    "<leader>sgb",
    function()
      Snacks.picker.git_branches()
    end,
    desc = "Git Branches",
    mode = "n",
    icon = { icon = " ", color = "purple" },
  },
  {
    "<leader>sgd",
    function()
      Snacks.picker.git_diff()
    end,
    desc = "Git Diff (Hunks)",
    mode = "n",
    icon = { icon = " ", color = "red" },
  },
  {
    "<leader>sgl",
    function()
      Snacks.picker.git_log()
    end,
    desc = "Git Log",
    mode = "n",
    icon = { icon = " ", color = "green" },
  },
  {
    "<leader>sgs",
    function()
      Snacks.picker.git_status()
    end,
    desc = "Git Status",
    mode = "n",
    icon = { icon = "󰊢 ", color = "yellow" },
  },
  {
    "<leader>sgS",
    function()
      Snacks.picker.git_stash()
    end,
    desc = "Git Stash",
    mode = "n",
    icon = { icon = "󰊢 ", color = "orange" },
  },
  {
    "<leader>sgf",
    function()
      Snacks.picker.git_log_file()
    end,
    desc = "Git Log File",
    mode = "n",
    icon = { icon = " ", color = "cyan" },
  },
  {
    "<leader>sgL",
    function()
      Snacks.picker.git_log_line()
    end,
    desc = "Git Log Line",
    mode = "n",
    icon = { icon = " ", color = "blue" },
  },
}
