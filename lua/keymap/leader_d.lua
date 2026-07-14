---@type wk.Spec
return {
  -- <leader>d Prefix (Debug)
  {
    "<leader>d",
    group = "debug",
    icon = { icon = "󰃤 ", color = "red" },
  },

  -- Core DAP actions
  {
    "<leader>dc",
    function()
      require("dap").continue()
    end,
    desc = "Continue",
    mode = "n",
    icon = { icon = "󰐊 ", color = "green" },
  },
  {
    "<leader>dn",
    function()
      require("dap").step_over()
    end,
    desc = "Step Over",
    mode = "n",
    icon = { icon = "󰆷 ", color = "blue" },
  },
  {
    "<leader>di",
    function()
      require("dap").step_into()
    end,
    desc = "Step Into",
    mode = "n",
    icon = { icon = "󰆹 ", color = "blue" },
  },
  {
    "<leader>do",
    function()
      require("dap").step_out()
    end,
    desc = "Step Out",
    mode = "n",
    icon = { icon = "󰆸 ", color = "blue" },
  },
  {
    "<leader>db",
    function()
      require("dap").toggle_breakpoint()
    end,
    desc = "Toggle Breakpoint",
    mode = "n",
    icon = { icon = "󰃤 ", color = "red" },
  },
  {
    "<leader>dB",
    function()
      require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end,
    desc = "Conditional Breakpoint",
    mode = "n",
    icon = { icon = "󰃤 ", color = "orange" },
  },
  {
    "<leader>dl",
    function()
      require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end,
    desc = "Log Point",
    mode = "n",
    icon = { icon = "󰃤 ", color = "cyan" },
  },
  {
    "<leader>dr",
    function()
      require("dap").repl.open()
    end,
    desc = "Open REPL",
    mode = "n",
    icon = { icon = "󰛿 ", color = "yellow" },
  },
  {
    "<leader>dL",
    function()
      require("dap").run_last()
    end,
    desc = "Run Last",
    mode = "n",
    icon = { icon = "󰑓 ", color = "yellow" },
  },
  {
    "<leader>dq",
    function()
      require("dap").terminate()
    end,
    desc = "Terminate",
    mode = "n",
    icon = { icon = "󰅖 ", color = "red" },
  },
  {
    "<leader>dp",
    function()
      require("dap").pause()
    end,
    desc = "Pause",
    mode = "n",
    icon = { icon = "󰏤 ", color = "orange" },
  },

  -- DAP UI
  {
    "<leader>du",
    function()
      require("dap-view").open()
    end,
    desc = "Open DAP View",
    mode = "n",
    icon = { icon = "󰍜 ", color = "purple" },
  },
  {
    "<leader>dU",
    function()
      require("dap-view").close()
    end,
    desc = "Close DAP View",
    mode = "n",
    icon = { icon = "󰍜 ", color = "purple" },
  },
  {
    "<leader>dh",
    function()
      require("dap.ui.widgets").hover()
    end,
    desc = "Hover Variables",
    mode = { "n", "v" },
    icon = { icon = "󰇮 ", color = "blue" },
  },
  {
    "<leader>dp",
    function()
      require("dap.ui.widgets").preview()
    end,
    desc = "Preview",
    mode = { "n", "v" },
    icon = { icon = "󰍜 ", color = "blue" },
  },

  -- Sessions
  {
    "<leader>ds",
    function()
      require("dap").session()
    end,
    desc = "Current Session",
    mode = "n",
    icon = { icon = "󰍜 ", color = "blue" },
  },

  -- Evaluate
  {
    "<leader>de",
    function()
      require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes, { border = "rounded" })
    end,
    desc = "Scopes Float",
    mode = "n",
    icon = { icon = "󰍜 ", color = "blue" },
  },

  -- Frames
  {
    "<leader>df",
    function()
      require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames, { border = "rounded" })
    end,
    desc = "Frames Float",
    mode = "n",
    icon = { icon = "󰍜 ", color = "blue" },
  },

  -- Threads
  {
    "<leader>dt",
    function()
      require("dap.ui.widgets").centered_float(require("dap.ui.widgets").threads, { border = "rounded" })
    end,
    desc = "Threads Float",
    mode = "n",
    icon = { icon = "󰍜 ", color = "blue" },
  },

  -- Launch configurations
  {
    "<leader>d.",
    function()
      require("dap").run(require("dap").configurations[vim.bo.filetype][1])
    end,
    desc = "Run First Config",
    mode = "n",
    icon = { icon = "󰑓 ", color = "green" },
  },
  {
    "<leader>d,",
    function()
      local configs = require("dap").configurations[vim.bo.filetype] or {}
      if #configs > 0 then
        vim.ui.select(configs, {
          prompt = "Select debug config: ",
          format_item = function(c)
            return c.name
          end,
        }, function(choice)
          if choice then
            require("dap").run(choice)
          end
        end)
      end
    end,
    desc = "Select Config",
    mode = "n",
    icon = { icon = "󰑓 ", color = "yellow" },
  },
}
