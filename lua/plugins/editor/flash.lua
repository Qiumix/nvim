local char = {
  -- dynamic configuration for ftFT motions
  config = function(opts)
    -- autohide flash when in operator-pending mode
    opts.autohide = opts.autohide or (vim.fn.mode(true):find("no") and vim.v.operator == "y")

    -- disable jump labels when not enabled, when using a count,
    -- or when recording/executing registers
    opts.jump_labels = opts.jump_labels
      and vim.v.count == 0
      and vim.fn.reg_executing() == ""
      and vim.fn.reg_recording() == ""

    -- Show jump labels only in operator-pending mode
    -- opts.jump_labels = vim.v.count == 0 and vim.fn.mode(true):find("o")
  end,
  -- hide after jump when not using jump labels
  autohide = false,
  -- show jump labels
  jump_labels = true,
  multi_line = false,
  -- When using jump labels, don't use these keys
  -- This allows using those keys directly after the motion
  label = { exclude = "hjkliardc" },

  search = { wrap = false },
  highlight = { backdrop = false },
  jump = {
    register = false,
    -- when using jump labels, set to 'true' to automatically jump
    -- or execute a motion when there is only one match
    autojump = false,
  },
}

return {
  "flash.nvim",
  after = function()
    require("flash").setup({
      modes = {
        char = char,
      },
    })
  end,
}
