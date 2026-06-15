---@module 'oil'
---@type oil.SetupOpts
local config = {
  default_file_explorer = true,
  delete_to_trash = true,
  skip_confirm_for_simple_edits = true,
  watch_for_changes = true,
  columns = { "icon" },
  win_options = {
    number = false,
    relativenumber = false,
    signcolumn = "no",
    foldcolumn = "0",
    statuscolumn = "",
  },
  view_options = {
    show_hidden = false,
    sort = {
      { "type", "asc" },
      { "name", "asc" },
    },
  },
  float = {
    padding = 2,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
    override = function(conf)
      local total_width = vim.o.columns
      local total_height = vim.o.lines
      local width = 70
      local height = 20

      local row = total_height - height - 3
      local col = total_width - width - 3

      conf.row = row
      conf.col = col
      conf.width = width
      conf.height = height

      conf.relative = "editor"

      return conf
    end,
  },

  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["l"] = "actions.select",
    ["h"] = "actions.parent",
    ["H"] = "actions.toggle_hidden",
    ["R"] = "actions.refresh",
    ["P"] = "actions.preview",
  },
}

return config
