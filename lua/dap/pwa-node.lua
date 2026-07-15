---@module "dap"
---@type dap.ServerAdapter|{dbg: string}
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
