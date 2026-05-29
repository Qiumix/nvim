local map = vim.keymap.set

map("n", "gd", vim.lsp.buf.definition, { desc = "LSP Goto Definition" })

-- Inspection tools (useful for debugging highlights and treesitter)
map("n", "<leader>ti", vim.show_pos, { desc = "Inspect Pos" })
map("n", "<leader>tI", "<cmd>InspectTree<cr>", { desc = "Inspect Tree" })

-- Keyword program (K for help on word under cursor)
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- ═══════════════════════════════════════════════════════════
-- FOLDING NAVIGATION (for code organization)
-- ═══════════════════════════════════════════════════════════

-- Close all folds except current one (great for focus)
map("n", "zv", "zMzvzz", { desc = "Close all folds except the current one" })

-- Smart fold navigation (closes current, opens next/previous)
map("n", "zj", "zcjzOzz", { desc = "Close current fold when open. Always open next fold." })
map("n", "zk", "zckzOzz", { desc = "Close current fold when open. Always open previous fold." })

-- Fix spelling (picks first suggestion)
map("n", "z0", "1z=", { desc = "Fix word under cursor" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- Quickfix and location lists
map("n", "<leader>xl", function()
  local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Location List" })

map("n", "<leader>xq", function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Quickfix List" })

map("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', { desc = "Toggle Fterm" })
map("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { desc = "Toggle Fterm" })

map("n", "<leader>oo", "<cmd>source<CR>", { desc = "Source file" })
map("n", "<leader>or", "<cmd>restart<CR>", { desc = "Restart" })

map("n", "<leader>k", ":TranslateNormal<CR>", { desc = "Translate word" })
map("v", "<leader>k", ":TranslateVisual<CR>", { desc = "Translate select" })
