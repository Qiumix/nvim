---@module "dap"
---@type dap.ServerAdapter|{dbg: string}
return {
  dbg = "lldb",
  type = "server",
  port = "${port}",
  executable = {
    command = "lldb-dap",
    args = { "--connection", "listen://127.0.0.1:${port}" },
  },
}
