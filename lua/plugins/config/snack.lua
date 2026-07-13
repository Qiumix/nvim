---@module "snacks"
---@type snacks.picker.Config
local picker_config = {
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
}
return {
  animate = { enabled = true },
  bigfile = { enabled = true, size = 500 * 1024 },
  dashboard = { enabled = false },
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
  picker = picker_config,
}
