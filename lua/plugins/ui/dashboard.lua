local config = {
  -- Whether to evaluate action of single active item
  evaluate_single = false,
  -- Items to be displayed. Should be an array with the following elements:
  -- - Item: table with <action>, <name>, and <section> keys.
  -- - Function: should return one of these three categories.
  -- - Array: elements of these three types (i.e. item, array, function).
  -- If `nil` (default), default items will be used (see |mini.starter|).
  items = nil,
  header = [[
┌───────────────────────────────────────────────────────┐
│                                                       │
│                      Witch Of Neko               󰃢    │
│                                                       │
│        ████████   ██ █  █ ██  █        │
│         ██   ██    ██   ██ ██    ██        │
│         ██   ██ ██ ██   ██ ████ ██      󰖩     │
│        ██   █ ██ ██   █ ██  ██ ██ ██         │
│         ██████████ █    ███  █ 󰴈      │
│                                                       │
│                                                       │
└───────────────────────────────────────────────────────┘
  ]],
  -- Array  of functions to be applied consecutively to initial content.
  -- Each function should take and return content for 'Starter' buffer (see
  -- |mini.starter| and |MiniStarter.content| for more details).
  content_hooks = nil,
  query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_-.",
  silent = false,
}

return {
  "mini.nvim",
  after = function()
    require("mini.starter").setup(config)
  end,
}
