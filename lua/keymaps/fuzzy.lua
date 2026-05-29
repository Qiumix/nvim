local map = vim.keymap.set

map("n", "<leader>ss", "<cmd>Tv<cr>", { desc = "Television" })
map("n", "<leader>sf", "<cmd>Tv files<cr>", { desc = "🔍 Search and open files" })
map("n", "<leader>sc", "<cmd>Tv text<cr>", { desc = "📝 Search text content" })
map("n", "<leader>se", "<cmd>Tv env<cr>", { desc = "🌐 Browse environment variables" })
map("n", "<leader>sd", "<cmd>Tv dirs<cr>", { desc = "📂 Browse directories" })
map("n", "<leader>sgb", "<cmd>Tv git-branch<cr>", { desc = "🌿 Switch git branches" })
map("n", "<leader>sgd", "<cmd>Tv git-diff<cr>", { desc = "🆚 Browse git diffs" })
map("n", "<leader>sgl", "<cmd>Tv git-log<cr>", { desc = "📜 Browse git commit history" })
