return {
  options = {
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = { "kitty-scrollback" },
      winbar = {},
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location", { "datetime", style = "%H:%M" } },
  },
  tabline = {
    lualine_a = {
      {
        "buffers",
        symbols = {
          alternate_file = "",
        },
      },
    },
    lualine_z = { "tabs" },
  },
  inactive_winbar = {},
  extensions = {},
}
