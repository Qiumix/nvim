---@type dap.ServerAdapter
---@field private dbg string
return {
  dbg = "pwa-node",
  type = "server",
  host = "127.0.0.1",
  port = "${port}",
  executable = {
    command = "js-debug-dap",
    args = { "${port}" },
  },
}
