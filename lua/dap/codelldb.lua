---@type dap.ServerAdapter
---@field private dbg string
return {
  dbg = "codelldb",
  type = "server",
  port = "${port}",
  executable = {
    command = "codelldb",
    args = { "--port", "${port}" },
  },
}
