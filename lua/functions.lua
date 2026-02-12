function gh(str)
  return 'https://github.com/' .. str
end

function only_require_without_vsc(plugin)
  if vim.g.vscode then
    return
  end
  return require(plugin)
end
