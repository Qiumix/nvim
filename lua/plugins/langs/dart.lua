---@module "zpack"
---@type zpack.Spec
return {
  {
    "nvim-flutter/flutter-tools.nvim",
    opts = {
      decorations = {
        statusline = {
          app_version = true,
          device = true,
          project_config = true,
        },
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  { "sidlatau/flutter-icons.nvim", dependencies = { "folke/snacks.nvim" } },
}
