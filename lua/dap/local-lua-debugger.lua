---@type dap.ExecutableAdapter
---@field private dbg string
return {
  dbg = "local-lua-debugger",
  type = "executable",
  command = "node",
  args = { "/usr/lib/node_modules/local-lua-debugger-vscode/extension/debugAdapter.js" },
}
