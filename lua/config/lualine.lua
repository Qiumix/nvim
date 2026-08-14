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
        icons_enabled = true,
        -- {'branch', icon = {'', align='right', color={fg='green'}}}
        icon = "",
        cond = nil, -- Condition function, the component is loaded when the function returns `true`.

        draw_empty = false, -- Whether to draw component even if it's empty.
        -- Might be useful if you want just the separator.

        -- Defines a custom color for the component:
        --
        -- 'highlight_group_name' | { fg = '#rrggbb'|cterm_value(0-255)|'color_name(red)', bg= '#rrggbb', gui='style' } | function
        -- Note:
        --  '|' is synonymous with 'or', meaning a different acceptable format for that placeholder.
        -- color function has to return one of other color types ('highlight_group_name' | { fg = '#rrggbb'|cterm_value(0-255)|'color_name(red)', bg= '#rrggbb', gui='style' })
        -- color functions can be used to have different colors based on state as shown below.
        --
        -- Examples:
        --   color = { fg = '#ffaa88', bg = 'grey', gui='italic,bold' },
        --   color = { fg = 204 }   -- When fg/bg are omitted, they default to the your theme's fg/bg.
        --   color = 'WarningMsg'   -- Highlight groups can also be used.
        --   color = function(section)
        --      return { fg = vim.bo.modified and '#aa3355' or '#33aa88' }
        --   end,
        color = nil, -- The default is your theme's color for that section and mode.
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
      },
    },
    lualine_z = { "tabs" },
  },
  inactive_winbar = {},
  extensions = {},
}
