---@type dap.Configuration[]
return {
  {
    name = "Launch (local-lua-debugger)",
    type = "local-lua-debugger",
    request = "launch",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}
