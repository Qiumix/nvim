local function transparent_theme()
  package.loaded["lualine.themes.gruvbox"] = nil
  package.loaded["lualine.themes.gruvbox_dark"] = nil
  local theme = vim.deepcopy(require("lualine.themes.gruvbox"))
  for _, mode in ipairs({ "normal", "insert", "visual", "replace", "command" }) do
    local a = theme[mode].a
    a.fg = a.bg
    a.bg = "NONE"
    for name, s in pairs(theme[mode]) do
      if name ~= "a" and type(s) == "table" then
        s.bg = "NONE"
        s.fg = "NONE"
      end
    end
  end
  for _, s in pairs(theme.inactive) do
    if type(s) == "table" then
      s.bg = "NONE"
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
    lualine_a = {
      {
        "mode",
        icon = "",
      },
    },
    lualine_b = { { "branch", color = { fg = "orange" } }, "diff", "diagnostics" },
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
        buffers_color = {
          active = "white",
          inactive = nil,
        },
      },
    },
    lualine_z = { "tabs" },
  },
  inactive_winbar = {},
  extensions = {},
}
