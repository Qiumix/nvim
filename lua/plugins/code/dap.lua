---@module "zpack"
---@type zpack.Spec
return {
  "mfussenegger/nvim-dap",
  lazy = false,
  config = function()
    local dap = require("dap")

    -- Adapter configurations
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = "codelldb",
        args = { "--port", "${port}" },
      },
    }

    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "-i", "dap" },
    }

    -- Rust configurations
    dap.configurations.rust = {
      {
        name = "Launch (codelldb)",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        args = {},
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        showDisassembly = "never",
        runInTerminal = false,
      },
      {
        name = "Select and attach to process (codelldb)",
        type = "codelldb",
        request = "attach",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        pid = function()
          local name = vim.fn.input("Executable name (filter): ")
          return require("dap.utils").pick_process({ filter = name })
        end,
        cwd = "${workspaceFolder}",
      },
      {
        name = "Attach to codelldb server :1234",
        type = "codelldb",
        request = "attach",
        target = "localhost:1234",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
      },
      {
        name = "Launch (gdb)",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        args = {},
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
      },
      {
        name = "Select and attach to process (gdb)",
        type = "gdb",
        request = "attach",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        pid = function()
          local name = vim.fn.input("Executable name (filter): ")
          return require("dap.utils").pick_process({ filter = name })
        end,
        cwd = "${workspaceFolder}",
      },
      {
        name = "Attach to gdbserver :1234",
        type = "gdb",
        request = "attach",
        target = "localhost:1234",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
      },
    }

    -- Auto-open/close dap-view
    local dap_view = require("dap-view")
    dap.listeners.before.attach.dapview = function()
      dap_view.open()
    end
    dap.listeners.before.launch.dapview = function()
      dap_view.open()
    end
    dap.listeners.before.event_terminated.dapview = function()
      dap_view.close()
    end
    dap.listeners.before.event_exited.dapview = function()
      dap_view.close()
    end
  end,
}
