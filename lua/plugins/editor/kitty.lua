---@type lz.n.Spec
return {
  "kitty-scrollback.nvim",
  cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackGenerateCommandLineEditing", "KittyScrollbackCheckHealth" },
  event = { "User KittyScrollbackLaunch" },
  after = function()
    vim.api.nvim_create_autocmd({ "FileType" }, {
      group = vim.api.nvim_create_augroup("KittyScrollbackNoConfirmYank", { clear = true }),
      pattern = { "kitty-scrollback" },
      callback = function()
        vim.keymap.set("n", "yy", '"+yy', { buffer = true, desc = "Native Yank Line" })
        vim.keymap.set("n", "y", '"+y', { buffer = true, desc = "Native Yank Operator" })
        vim.keymap.set("v", "y", '"+y', { buffer = true, desc = "Native Visual Yank" })
      end,
    })

    require("kitty-scrollback").setup()
  end,
}
