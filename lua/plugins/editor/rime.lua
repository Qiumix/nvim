return {
  'rime-toggle.nvim',
  after = function()
    require('rime_toggle').setup({
      enabled = true,
      smart_esc = true
    })
  end
}
