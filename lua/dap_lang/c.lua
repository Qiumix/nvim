local ae = require("dap_lang.util").auto_executable

---@type dap.Configuration[]
return {
  {
    name = "Launch (lldb)",
    type = "lldb",
    request = "launch",
    program = ae,
    args = {},
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
  {
    name = "Launch (gdb)",
    type = "gdb",
    request = "launch",
    program = ae,
    args = {},
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
}
