local function transparent_theme()
  local theme = require("lualine.themes.gruvbox")
  for _, mode in ipairs({ "normal", "insert", "visual", "replace", "command" }) do
    for _, section in pairs(theme[mode]) do
      if type(section) == "table" then
        section.bg = "NONE"
        section.fg = "NONE"
      end
    end
  end
  for _, section in pairs(theme.inactive) do
    if type(section) == "table" then
      section.bg = "NONE"
    end
  end
  return theme
end

return {
  options = {
    theme = transparent_theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
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
