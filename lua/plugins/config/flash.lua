return {
  modes = {
    char = {
      config = function(opts)
        opts.autohide = opts.autohide or (vim.fn.mode(true):find("no") and vim.v.operator == "y")
        opts.jump_labels = opts.jump_labels
          and vim.v.count == 0
          and vim.fn.reg_executing() == ""
          and vim.fn.reg_recording() == ""
      end,
      autohide = false,
      jump_labels = true,
      multi_line = false,
      label = { exclude = "hjkliardc" },

      search = { wrap = false },
      highlight = { backdrop = false },
      jump = {
        register = false,
        autojump = false,
      },
    },
  },
}
