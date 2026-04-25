return {
  'neoscroll.nvim',
  after = function()
    require('neoscroll').setup({ mappings = {} })
  end
}
