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

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

map("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', { desc = "Toggle Fterm" })
map("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { desc = "Toggle Fterm" })

map("n", "<leader>oo", "<cmd>source<CR>", { desc = "Source file" })
map("n", "<leader>or", "<cmd>restart<CR>", { desc = "Restart" })

map("n", "<leader>k", ":TranslateNormal<CR>", { desc = "Translate word" })
map("v", "<leader>k", ":TranslateVisual<CR>", { desc = "Translate select" })

map("n", "<leader>lf", vim.lsp.buf.format, { desc = "LSP Format" })
-- map("n", "<leader>ld", vim.diagnostic.get, { desc = "Get Diagnostic " })
map("n", "<leader>ld", vim.diagnostic.setqflist, { desc = "Open Diagnostic Buffer" })

map("n", "<leader>e", "<cmd>Yazi<CR>", { desc = "Yazi" })
-- Alternative buffer switching (vim-style)
