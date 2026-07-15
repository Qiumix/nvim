---@module "zpack"
---@type zpack.Spec
return {
  "igorlfs/nvim-dap-view",
  version = vim.version.range("1.*"),
  dependencies = { "mfussenegger/nvim-dap" },
  opts = {
    auto_toggle = true,
    follow_tab = true,
    winbar = {
      show = true,
      sections = {
        "breakpoints",
        "scopes",
        "repl",
        "watches",
        "threads",
        -- "exceptions",
        -- "console",
      },
      default_section = "scopes",
      controls = {
        enabled = false,
        position = "right",
        buttons = {
          "play",
          "step_into",
          "step_over",
          "step_out",
          "step_back",
          "run_last",
          "terminate",
          "disconnect",
        },
      },
    },
    windows = {
      size = 0.35,
      position = "left",
      terminal = {
        size = 0.4,
        position = "right",
      },
    },
    help = { border = "rounded" },
    switchbuf = "usetab",
    keymaps = {
      base = {
        next_view = "]v",
        prev_view = "[v",
        jump_to_first = "[V",
        jump_to_last = "]V",
        help = "g?",
      },
    },
  },
}
