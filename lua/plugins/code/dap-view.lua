---@module "zpack"
---@type zpack.Spec
return {
  "igorlfs/nvim-dap-view",
  version = vim.version.range("1.*"),
  dependencies = { "mfussenegger/nvim-dap" },
  opts = {
    auto_toggle = true,
    winbar = {
      show = true,
      sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl", "console" },
      default_section = "scopes",
      controls = {
        enabled = true,
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
      size = 0.4,
      position = "below",
      terminal = {
        size = 0.3,
        hide = { "console" },
      },
    },
    help = {
      border = "rounded",
    },
    switchbuf = "usetab",
  },
  cmd = { "DapViewOpen", "DapViewClose", "DapViewToggle" },
}
