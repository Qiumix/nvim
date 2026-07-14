---@module "zpack"
---@type zpack.Spec
return {
  "aznhe21/actions-preview.nvim",
  opts = {
    highlight_command = {
      -- require("actions-preview.highlight").delta(),
      -- require("actions-preview.highlight").diff_so_fancy(),
      -- require("actions-preview.highlight").diff_highlight(),
    },
    backend = { "snacks", "minipick", "nui" },
    snacks = {
      layout = { preset = "vertical" },
    },
  },
}
