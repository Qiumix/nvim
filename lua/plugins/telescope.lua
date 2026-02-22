local telescope = require("telescope")

telescope.setup({
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
    }
  }
})
telescope.load_extension("ui-select")

require("actions-preview").setup {
  backend = { "telescope" },
  extensions = { "env" },
  telescope = vim.tbl_extend(
    "force",
    require("telescope.themes").get_dropdown(), {}
  )
}

local builtin = require("telescope.builtin")
local map = vim.keymap.set
map({ "n" }, "<leader>f", builtin.find_files, { desc = "Telescope live grep" })
local function git_files() builtin.find_files({ no_ignore = true }) end

map({ "n" }, "<leader>g", builtin.live_grep, { desc = "live_grep" })
map({ "n" }, "<leader>sg", git_files, { desc = "git_files" })
map({ "n" }, "<leader>sb", builtin.buffers, { desc = "buffers" })
map({ "n" }, "<leader>si", builtin.grep_string, { desc = "grep_string" })
map({ "n" }, "<leader>so", builtin.oldfiles, { desc = "oldfiles" })
map({ "n" }, "<leader>sh", builtin.help_tags, { desc = "help_tags" })
map({ "n" }, "<leader>sm", builtin.man_pages, { desc = "man_pages" })
map({ "n" }, "<leader>sr", builtin.lsp_references, { desc = "lsp_references" })
map({ "n" }, "<leader>sd", builtin.diagnostics, { desc = "diagnostics" })
-- map({ "n" }, "<leader>si", builtin.lsp_implementations)
map({ "n" }, "<leader>sT", builtin.lsp_type_definitions, { desc = "lsp_type_definitions" })
map({ "n" }, "<leader>ss", builtin.current_buffer_fuzzy_find, { desc = "current_buffer_fuzzy_find" })
map({ "n" }, "<leader>st", builtin.builtin, { desc = "builtin" })
map({ "n" }, "<leader>sc", builtin.git_bcommits, { desc = "git_bcommits" })
map({ "n" }, "<leader>sk", builtin.keymaps, { desc = "keymaps" })
map({ "n" }, "<leader>se", "<cmd>Telescope env<cr>")
map({ "n" }, "<leader>sf", "<cmd>Telescope find_files<cr>")
