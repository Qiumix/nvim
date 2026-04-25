local config = {
  content = {
    active = nil,
    inactive = nil,
  },
  use_icons = true,
}

require("mini.statusline").setup(config)
return {
  {
    "mini.nvim",
    event = "BufEnter",
    after = function()
      require("mini.statusline").setup(config)
    end,
  },
}
