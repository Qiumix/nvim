if not vim.g.vscode then
  require('typst-preview').setup({
    dependencies_bin = {
      ['tinymist'] = '/usr/bin/tinymist',
      ['websocat'] = '/usr/bin/websocat'
    },
  })
end
