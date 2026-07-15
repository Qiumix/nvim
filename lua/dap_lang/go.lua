---@type dap.Configuration[]
return {
  {
    name = "Debug (dlv)",
    type = "dlv",
    request = "launch",
    program = "${workspaceFolder}",
    args = {},
    cwd = "${workspaceFolder}",
  },
}
