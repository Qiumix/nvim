return {
  -- {
  --   'mini.surround',
  --   after = function()
  --     require('mini.surround').setup()
  --   end
  -- },
  -- {
  --   'mini.statusline',
  --   after = function()
  --     require('mini.statusline').setup()
  --   end
  -- },
  -- {
  --   'mini.tabline',
  --   after = function()
  --     require('mini.tabline').setup()
  --   end
  -- },
  -- {
  --   'mini.icons',
  --   after = function()
  --     require('mini.icons').setup()
  --   end
  -- },
  -- {
  --   'mini.cursorword',
  --   after = function()
  --     require('mini.cursorword').setup({ delay = 0 })
  --   end
  -- }
  "mini.nvim",
  after = function()
    require("mini.surround").setup()
    require("mini.cursorword").setup({ delay = 0 })
    require("mini.icons").setup()
    require("mini.tabline").setup()
    require("mini.statusline").setup()
    require("mini.surround").setup()
  end,
}
