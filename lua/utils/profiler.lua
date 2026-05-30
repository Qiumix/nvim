if vim.g.prof_ena then
  vim.cmd.packadd("snacks.nvim")
  require("snacks.profiler").startup({
    startup = {
      event = "VimEnter",
    },
  })

  vim.api.nvim_create_autocmd("UIEnter", {
    callback = function()
      Snacks.toggle.profiler():map("<leader>dpp")
      Snacks.toggle.profiler_highlights():map("<leader>dph")
      vim.keymap.set("n", "<leader>dps", Snacks.profiler.scratch, { desc = "Profiler Scratch Bufer" })
    end,
  })
end
