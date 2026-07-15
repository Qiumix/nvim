---@type dap.ServerAdapter
---@field private dbg string
return {
  dbg = "dlv",
  type = "server",
  port = "${port}",
  executable = {
    command = "dlv",
    args = { "dap", "--listen", "127.0.0.1:${port}" },
  },
}
