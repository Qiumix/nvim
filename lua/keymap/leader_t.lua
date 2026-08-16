---@type wk.Spec
return {
  {
    "<leader>tw",
    "<cmd>set wrap!<CR>",
    desc = "Toggle Wrap",
    mode = "n",
    silent = true,
    icon = { icon = "󰖶 ", color = "cyan" },
  },
  {
    "<leader>tm",
    "<cmd>RenderMarkdown buf_toggle<CR>",
    desc = "Toggle Render Markdown",
    mode = "n",
    silent = true,
    icon = { icon = " ", color = "cyan" },
  },
  { "<leader>ti", vim.show_pos, desc = "Inspect Pos", mode = "n", icon = { icon = "󰋼 ", color = "yellow" } },
  {
    "<leader>tI",
    "<cmd>InspectTree<cr>",
    desc = "Inspect Tree",
    mode = "n",
    icon = { icon = "󰙅 ", color = "yellow" },
  },
  {
    "<leader>td",
    "<cmd>TinyInlineDiag toggle<cr>",
    desc = "Toggle Inline Diagnostics",
    mode = "n",
    silent = true,
    icon = { icon = "󰀦 ", color = "orange" },
  },
  {
    "<leader>tc",
    "<cmd>TinyInlineDiag toggle_cursor_only<cr>",
    desc = "Toggle Cursor-Only Diags",
    mode = "n",
    silent = true,
    icon = { icon = "󰃤 ", color = "orange" },
  },
  {
    "<leader>tl",
    function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end,
    desc = "Toggle Inlay Hints",
    mode = "n",
    silent = true,
    icon = { icon = "󰙏 ", color = "yellow" },
  },

  {
    "<leader>tf",
    function()
      if vim.g.disable_autoformat then
        vim.g.disable_autoformat = false
        vim.notify("Autoformat enabled", vim.log.levels.INFO)
      else
        vim.g.disable_autoformat = true
        vim.notify("Autoformat disabled", vim.log.levels.INFO)
      end
    end,
    desc = "Toggle autoformat(global)",
    mode = "n",
    icon = { icon = "󰉼 ", color = "green" },
  },
  {
    "<leader>tt",
    function()
      local sw = vim.bo.shiftwidth
      if vim.bo.expandtab then
        vim.bo.expandtab = false
        vim.bo.softtabstop = 0
        vim.notify("Tab style: tabs (shiftwidth=" .. sw .. ")", vim.log.levels.INFO)
      else
        vim.bo.expandtab = true
        vim.bo.softtabstop = 2
        vim.bo.shiftwidth = 2
        vim.notify("Tab style: spaces (shiftwidth=" .. sw .. ")", vim.log.levels.INFO)
      end
    end,
    desc = "Toggle tab/spaces",
    mode = "n",
    icon = { icon = "󰌒 ", color = "cyan" },
  },
}
