---@module "dap"
---@type dap.ServerAdapter|{dbg: string}
return {
  dbg = "gdb",
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" },
}
