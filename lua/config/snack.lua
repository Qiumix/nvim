return {
  animate = { enabled = true },
  bigfile = { enabled = true, size = 500 * 1024 },
  dashboard = {
    enabled = false,
    preset = {
      header = [[
┌───────────────────────────────────────────────────────┐
│                                                       │
│                     Witch Of Neko                󰃢    │
│                                                       │
│        ████████   ██ █  █ ██  █        │
│         ██   ██    ██   ██ ██    ██        │
│         ██   ██ ██ ██   ██ ████ ██      󰖩     │
│        ██   █ ██ ██   █ ██  ██ ██ ██         │
│         ██████████ █    ███  █ 󰴈      │
│                                                       │
│                                                       │
└───────────────────────────────────────────────────────┘
      ]],
      keys = {
        { icon = "󰈞  ", key = "f", desc = "Find Files", action = "Snacks.picker.files()" },
        { icon = "󰦨  ", key = "g", desc = "Live Grep", action = "Snacks.picker.grep()" },
        { icon = "󰍉  ", key = "s", desc = "Smart Search", action = "Snacks.picker.smart()" },
        { icon = "󰈙  ", key = "b", desc = "Buffers", action = "Snacks.picker.buffers()" },
        { icon = "󰈔  ", key = "r", desc = "Recent Files", action = "Snacks.picker.recent()" },
        { icon = "󰉋  ", key = "e", desc = "File Explorer", action = "Snacks.explorer()" },
        { icon = "  ", key = "l", desc = "Git Log", action = "Snacks.picker.git_log()" },
        { icon = "  ", key = "B", desc = "Git Branches", action = "Snacks.picker.git_branches()" },
        { icon = "󰊢  ", key = "S", desc = "Git Status", action = "Snacks.picker.git_status()" },
        { icon = "󰒲  ", key = "p", desc = "Projects", action = "Snacks.picker.projects()" },
        { icon = "󰃤  ", key = "c", desc = "Config", action = "edit $MYVIMRC" },
        { icon = "󰁯  ", key = "n", desc = "New File", action = "enew" },
        { icon = "󰈆  ", key = "q", desc = "Quit", action = "quit" },
      },
    },
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
    },
  },
  dim = { enabled = true },
  explorer = { enabled = true, replace_netrw = true },
  image = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
  layout = { enabled = true },
  notifier = { enabled = true },
  quickfile = { enabled = true },
  scope = { enabled = true },
  scratch = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  terminal = { enabled = true },
  toggle = { enabled = true },
  words = { enabled = false },
  zen = { enabled = true },
  picker = {
    sources = {
      explorer = {
        layout = { preset = "sidebar", preview = "main" },
        auto_close = false,
        jump = { close = false },
      },
    },
    win = {
      input = {
        keys = {
          ["<c-x>"] = { "bufdelete", mode = { "n", "i" } },
        },
      },
      list = { keys = { ["dd"] = "bufdelete" } },
    },
  },
}
