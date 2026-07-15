---@type dap.Configuration[]
return {
  {
    name = "Launch (pwa-node)",
    type = "pwa-node",
    request = "launch",
    program = "${file}",
    cwd = "${workspaceFolder}",
    skipFiles = { "<node_internals>/**" },
  },
}
