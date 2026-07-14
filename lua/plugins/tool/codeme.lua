---@module "zpack"
---@type zpack.Spec
return {
  src = "https://gitlab.com/tduyng/codeme.nvim",
  cmd = { "CodeMe", "CodeMeToggle" },
  opts = {
    verbose = true, -- Show notifications
    goals = {
      daily_hours = 4,
      daily_lines = 500,
    },
  },
}
