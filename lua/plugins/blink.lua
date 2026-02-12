-- Lazy load on first insert mode entry
local group = vim.api.nvim_create_augroup("BlinkCmpLazyLoad", { clear = true })

local keymap = {
  preset = "default",
  ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
  ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
}

local signature = {
  enabled = true
}

local completion = {
  documentation = { auto_show = true },
}

local cmdline = {
  completion = {
    menu = {
      auto_show = true
    },
  },
}

vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  group = group,
  once = true,
  callback = function()
    require("blink.cmp").setup({
      keymap = keymap,
      signature = signature,
      completion = completion,
      cmdline = cmdline,

      appearance = {
        nerd_font_variant = "mono",
        use_nvim_cmp_as_default = true,
      },
      sources = {
        default = { "snippets", "lsp", "path", "buffer" },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    })
  end,
})
