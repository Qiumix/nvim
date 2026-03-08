-- VSCode-specific keymaps for search and navigation
vim.keymap.set("n", "<leader><space>", "<cmd>Find<cr>")
vim.keymap.set("n", "<leader>/", function()
  vscode.call("workbench.action.findInFiles")
end)
vim.keymap.set("n", "<leader>ss", function()
  vscode.call("workbench.action.gotoSymbol")
end)

-- Toggle VS Code integrated terminal
for _, lhs in ipairs({ "<leader>ft", "<leader>fT", "<c-/>" }) do
  vim.keymap.set("n", lhs, function()
    vscode.call("workbench.action.terminal.toggleTerminal")
  end)
end

-- Navigate VSCode tabs like lazyvim buffers
vim.keymap.set("n", "<S-h>", function()
  vscode.call("workbench.action.previousEditor")
end)
vim.keymap.set("n", "<S-l>", function()
  vscode.call("workbench.action.nextEditor")
end)
