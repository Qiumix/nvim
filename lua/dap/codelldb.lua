---@module "dap"
---@type dap.ServerAdapter|{dbg: string}
return {
  dbg = "codelldb",
  type = "server",
  port = "${port}",
  executable = {
    command = "codelldb",
    args = { "--port", "${port}" },
  },
}
