---@module "dap"
---@type dap.ServerAdapter|{dbg: string}
return {
  dbg = "local-lua-debugger",
  type = "executable",
  command = "node",
  args = { "/usr/lib/node_modules/local-lua-debugger-vscode/extension/debugAdapter.js" },
}
