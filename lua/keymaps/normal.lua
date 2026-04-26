local map = vim.keymap.set

map("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', { desc = "Toggle Fterm" })
map("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { desc = "Toggle Fterm" })

map("n", "<leader>oo", "<cmd>source<CR>", { desc = "Source file" })
map("n", "<leader>or", "<cmd>restart<CR>", { desc = "Restart" })

map("n", "<leader>k", ":TranslateNormal<CR>", { desc = "Translate word" })
map("v", "<leader>k", ":TranslateVisual<CR>", { desc = "Translate select" })
