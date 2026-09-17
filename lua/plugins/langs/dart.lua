---@module "zpack"
---@type zpack.Spec
return {
  {
    "nvim-flutter/flutter-tools.nvim",
    ft = "dart",
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
  { "sidlatau/flutter-icons.nvim", ft = "dart", dependencies = { "folke/snacks.nvim" } },
}
