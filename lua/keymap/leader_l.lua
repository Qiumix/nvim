---@type wk.Spec
return {
  -- <leader>l Prefix (LSP & Language tools)
  {
    "<leader>ld",
    vim.diagnostic.setqflist,
    desc = "Open Diagnostic Buffer",
    mode = "n",
    icon = { icon = "󰃤 ", color = "red" },
  },
  {
    "<leader>lf",
    function()
      local has_conform, conform = pcall(require, "conform")
      if has_conform then
        conform.format({ async = true }, function(err, did_edit)
          if not err and did_edit then
            vim.notify("Code formatted", vim.log.levels.INFO, { title = "Conform" })
          end
        end)
      else
        vim.lsp.buf.format({ async = true })
      end
    end,
    desc = "Format buffer",
    mode = { "n", "x" },
    icon = { icon = "󰏫 ", color = "green" },
  },
  {
    "<leader>lt",
    "<cmd>TypstPreview<cr>",
    desc = "Preview Typst",
    mode = "n",
    icon = { icon = " ", color = "green" },
  },
}
