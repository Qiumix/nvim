---
---Return full url of a github repo
---
---@param str string
---@return string
function gh(str)
  return 'https://github.com/' .. str
end

---
---Loads the given module when gui is not vscode,
---returns any value returned by the given module(`true` when `nil`).
---
---@param modname string
---@return unknown
function only_require_without_vsc(modname)
  if vim.g.vscode then
    return nil
  end
  return require(modname)
end
