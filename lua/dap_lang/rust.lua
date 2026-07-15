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
    name = "Select and attach to process (lldb)",
    type = "lldb",
    request = "attach",
    program = ae,
    pid = function()
      local name = vim.fn.input("Executable name (filter): ")
      return require("dap.utils").pick_process({ filter = name })
    end,
    cwd = "${workspaceFolder}",
  },
  {
    name = "Attach to lldb server :1234",
    type = "lldb",
    request = "attach",
    target = "localhost:1234",
    program = ae,
    cwd = "${workspaceFolder}",
  },
  {
    name = "Launch (codelldb)",
    type = "codelldb",
    request = "launch",
    program = ae,
    args = {},
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    showDisassembly = "never",
    runInTerminal = false,
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
  {
    name = "Select and attach to process (gdb)",
    type = "gdb",
    request = "attach",
    program = ae,
    pid = function()
      local name = vim.fn.input("Executable name (filter): ")
      return require("dap.utils").pick_process({ filter = name })
    end,
    cwd = "${workspaceFolder}",
  },
}
