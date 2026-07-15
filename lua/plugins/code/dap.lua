---@module "zpack"
---@type zpack.Spec
return {
  "mfussenegger/nvim-dap",
  lazy = false,
  config = function()
    local dap = require("dap")

    --- Auto-detect executable path per language
    local function auto_executable()
      local ft = vim.bo.filetype
      local root = vim.fs.root(0, { "Cargo.toml", "CMakeLists.txt", "build.zig", "go.mod", "package.json", ".git" })
        or vim.fn.getcwd()
      if ft == "rust" then
        local cargo = vim.fn.readfile(root .. "/Cargo.toml", "", 20) or {}
        for _, line in ipairs(cargo) do
          local name = line:match('name%s*=%s*"([^"]+)"')
          if name then
            local path = root .. "/target/debug/" .. name
            if vim.fn.executable(path) == 1 then
              return path
            end
            return root .. "/target/debug/"
          end
        end
        return root .. "/target/debug/"
      elseif ft == "c" or ft == "cpp" then
        if vim.fn.filereadable(root .. "/CMakeLists.txt") == 1 then
          return root .. "/build/"
        end
        return vim.fn.input("Path to executable: ", root .. "/build/", "file")
      elseif ft == "zig" then
        return root .. "/zig-out/bin/"
      elseif ft == "go" then
        return "${workspaceFolder}"
      elseif ft:match("javascript") or ft:match("typescript") then
        return "${file}"
      elseif ft == "lua" then
        return "${file}"
      end
      return vim.fn.input("Path to executable: ", root .. "/target/debug/", "file")
    end

    -- ── Adapters ───────────────────────────────────────────────

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = "codelldb",
        args = { "--port", "${port}" },
      },
    }

    dap.adapters.lldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = "lldb-dap",
        args = { "--connection", "listen://127.0.0.1:${port}" },
      },
    }

    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "-i", "dap" },
    }

    dap.adapters.dlv = {
      type = "server",
      port = "${port}",
      executable = {
        command = "dlv",
        args = { "dap", "--listen", "127.0.0.1:${port}" },
      },
    }

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "127.0.0.1",
      port = "${port}",
      executable = {
        command = "js-debug-dap",
        args = { "${port}" },
      },
    }

    dap.adapters["local-lua-debugger"] = {
      type = "executable",
      command = "node",
      args = { "/usr/lib/node_modules/local-lua-debugger-vscode/extension/debugAdapter.js" },
    }

    -- ── Rust ───────────────────────────────────────────────────

    dap.configurations.rust = {
      {
        name = "Launch (lldb)",
        type = "lldb",
        request = "launch",
        program = auto_executable,
        args = {},
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
      {
        name = "Select and attach to process (lldb)",
        type = "lldb",
        request = "attach",
        program = auto_executable,
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
        program = auto_executable,
        cwd = "${workspaceFolder}",
      },
      {
        name = "Launch (codelldb)",
        type = "codelldb",
        request = "launch",
        program = auto_executable,
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
        program = auto_executable,
        args = {},
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
      },
      {
        name = "Select and attach to process (gdb)",
        type = "gdb",
        request = "attach",
        program = auto_executable,
        pid = function()
          local name = vim.fn.input("Executable name (filter): ")
          return require("dap.utils").pick_process({ filter = name })
        end,
        cwd = "${workspaceFolder}",
      },
    }

    -- ── C / C++ ────────────────────────────────────────────────

    ---@type dap.Configuration[]
    local cpp_configs = {
      {
        name = "Launch (lldb)",
        type = "lldb",
        request = "launch",
        program = auto_executable,
        args = {},
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
      {
        name = "Launch (gdb)",
        type = "gdb",
        request = "launch",
        program = auto_executable,
        args = {},
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
      },
    }
    dap.configurations.c = cpp_configs
    dap.configurations.cpp = cpp_configs

    -- ── Zig ────────────────────────────────────────────────────

    dap.configurations.zig = {
      {
        name = "Launch (lldb)",
        type = "lldb",
        request = "launch",
        program = auto_executable,
        args = {},
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }

    -- ── Go ─────────────────────────────────────────────────────

    dap.configurations.go = {
      {
        name = "Debug (dlv)",
        type = "dlv",
        request = "launch",
        program = "${workspaceFolder}",
        args = {},
        cwd = "${workspaceFolder}",
      },
    }

    -- ── JavaScript / TypeScript ────────────────────────────────

    ---@type dap.Configuration[]
    local js_configs = {
      {
        name = "Launch (pwa-node)",
        type = "pwa-node",
        request = "launch",
        program = "${file}",
        cwd = "${workspaceFolder}",
        skipFiles = { "<node_internals>/**" },
      },
    }
    dap.configurations.javascript = js_configs
    dap.configurations.typescript = js_configs
    dap.configurations.javascriptreact = js_configs
    dap.configurations.typescriptreact = js_configs

    -- ── Lua ────────────────────────────────────────────────────

    dap.configurations.lua = {
      {
        name = "Launch (local-lua-debugger)",
        type = "local-lua-debugger",
        request = "launch",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
    }

    -- ── Auto-open/close dap-view ──────────────────────────────

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
