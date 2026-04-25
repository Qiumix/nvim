local config = {
  dimensions = {
    height = 0.8,
    width = 0.8,
  },
}

return {
  'FTerm.nvim',
  after = function()
    require('FTerm').setup(config)
  end
}
