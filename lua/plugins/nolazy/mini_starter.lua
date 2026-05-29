local starter = require("mini.starter")

local items = {
  { name = "n ░ New File", action = "enew", section = "󱜕  Utils" },
  { name = "f ░ Find Files", action = "Tv files", section = "📺 Television Finder" },
  { name = "g ░ Live Grep", action = "Tv text", section = "📺 Television Finder" },
  { name = "l ░ Git Logs", action = "Tv git-log", section = "📺 Television Finder" },
  { name = "b ░ Git Branches", action = "Tv git-branch", section = "📺 Television Finder" },
  { name = "t ░ Select Channel", action = "Tv", section = "📺 Television Finder" },

  { name = "c ░ Neovim Config", action = "edit $MYVIMRC", section = "🔧 Maintenance" },
}

local config = {
  items = items,
  evaluate_single = true,
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
  footer = "",
  content_hooks = {
    starter.gen_hook.aligning("center", "center"),
  },
}

starter.setup(config)
