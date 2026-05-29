local map = vim.keymap.set

-- ═══════════════════════════════════════════════════════════
-- BUFFER NAVIGATION (think browser tabs)
-- ═══════════════════════════════════════════════════════════

map("n", "<leader>lf", vim.lsp.buf.format, { desc = "LSP Format" })
-- map("n", "<leader>ld", vim.diagnostic.get, { desc = "Get Diagnostic " })
map("n", "<leader>ld", vim.diagnostic.setqflist, { desc = "Open Diagnostic Buffer" })

map("n", "<leader>e", "<cmd>Yazi<CR>", { desc = "Yazi" })
-- Alternative buffer switching (vim-style)
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete Current Buffer" })
