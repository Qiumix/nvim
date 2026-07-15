---@type dap.ExecutableAdapter
---@field private dbg string
return {
  dbg = "gdb",
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" },
}
