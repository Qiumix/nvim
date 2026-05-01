vim.g.disable_autoformat = true
local map = vim.keymap.set

-- clear
map(
  "n",
  "<leader>ul",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- Toggle line wrapping
map("n", "<leader>uw", "<cmd>set wrap!<CR>", { desc = "Toggle Wrap", silent = true })
map("n", "<leader>uf", function()
  if vim.g.disable_autoformat then
    vim.g.disable_autoformat = false
    vim.notify("Autoformat disabled", vim.log.levels.INFO)
  else
    vim.g.disable_autoformat = true
    vim.notify("Autoformat enabled", vim.log.levels.INFO)
  end
end, { desc = "Toggle autoformat(global)" })
