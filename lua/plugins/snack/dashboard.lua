---@class snacks.dashboard.Config
local dashboard_config = {
  enabled = true,
  preset = {
    header = require("plugins.snack.header"),
    keys = {
      { icon = "󰦨  ", key = "s", desc = "Live Grep", action = "Snacks.picker.grep()" },
      { icon = "󰍉  ", key = "f", desc = "Find Files", action = "Snacks.picker.smart()" },
      { icon = "󰈔  ", key = "r", desc = "Recent Files", action = "Snacks.picker.recent()" },
      { icon = "󰒲  ", key = "p", desc = "Projects", action = "Snacks.picker.projects()" },
      { icon = "󰁯  ", key = "n", desc = "New File", action = "enew" },
      { icon = "󰈆  ", key = "q", desc = "Quit", action = "quit" },
    },
  },
  sections = {
    { section = "header" },
    { section = "keys", gap = 1, padding = 1 },
  },
}
return { enabled = false }
