local config = {
  defaults = {
    preview = { treesitter = false },
    color_devicons = true,
    sorting_strategy = "ascending",
    path_displays = { "smart" },
    layout_config = {
      height = 100,
      width = 400,
      prompt_position = "top",
      preview_cutoff = 40,
    },
  },
}

return {
  "telescope.nvim",
  after = function()
    local telescope = require("telescope")
    telescope.setup(config)
  end,
}
