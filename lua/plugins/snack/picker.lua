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
return picker_config
