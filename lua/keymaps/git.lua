local map = vim.keymap.set

map("n", "]c", function()
  if vim.wo.diff then
    vim.cmd.normal({ "]c", bang = true })
  else
    vim.g.git.nav_hunk("next")
  end
end)

map("n", "[c", function()
  if vim.wo.diff then
    vim.cmd.normal({ "[c", bang = true })
  else
    vim.g.git.nav_hunk("prev")
  end
end)

-- Actions
map("n", "<leader>hs", function()
  vim.g.git.stage_hunk()
end)
map("n", "<leader>hr", function()
  vim.g.git.reset_hunk()
end)

map("v", "<leader>hs", function()
  vim.g.git.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)

map("v", "<leader>hr", function()
  vim.g.git.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)

map("n", "<leader>hS", function()
  vim.g.git.stage_buffer()
end)
map("n", "<leader>hR", function()
  vim.g.git.reset_buffer()
end)
map("n", "<leader>hp", function()
  vim.g.git.preview_hunk()
end)
map("n", "<leader>hi", function()
  vim.g.git.preview_hunk_inline()
end)

map("n", "<leader>hb", function()
  vim.g.git.blame_line({ full = true })
end)

map("n", "<leader>hd", function()
  vim.g.git.diffthis()
end)

map("n", "<leader>hD", function()
  vim.g.git.diffthis("~")
end)

map("n", "<leader>hQ", function()
  vim.g.git.setqflist("all")
end)
map("n", "<leader>hq", function()
  vim.g.git.setqflist()
end)

-- Toggles
map("n", "<leader>tb", function()
  vim.g.git.toggle_current_line_blame()
end)
map("n", "<leader>tw", function()
  vim.g.git.toggle_word_diff()
end)

-- Text object
map({ "o", "x" }, "ih", function()
  vim.g.git.select_hunk()
end)
