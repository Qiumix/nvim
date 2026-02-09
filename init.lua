vim.g.mapleader = " "
vim.g.maplocalleader = " "

gh = function(str) return 'https://github.com/' .. str end
require("config")
require("plugins")

vim.pack.add({
  { src = gh("catppuccin/nvim") },
  { src = gh("xiyaowong/transparent.nvim") },
  { src = gh("stevearc/oil.nvim") },
  { src = gh("neovim/nvim-lspconfig") },
  { src = gh("echasnovski/mini.pick") },
  { src = gh('folke/which-key.nvim') },
  { src = gh('windwp/nvim-autopairs') },
  { src = gh('saecki/crates.nvim') },
  { src = gh('nvim-lua/plenary.nvim') },
  { src = gh('mikavilpas/yazi.nvim'),      version = vim.version.range('*') },
  { src = gh('Saghen/blink.cmp'),          version = vim.version.range('*') }
})

-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('my.lsp', {}),
--   callback = function(args)
--     local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
--     if client:supports_method('textDocument/completion') then
--       -- Optional: trigger autocompletion on EVERY keypress. May be slow!
--       local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
--       client.server_capabilities.completionProvider.triggerCharacters = chars
--       vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
--     end
--   end,
-- })

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

require 'mini.pick'.setup()
require 'oil'.setup()
require 'crates'.setup()
require 'which-key'.setup({
  preset = 'helix',
})
vim.cmd("colorscheme catppuccin")
vim.cmd("hi statusline guibg=NONE")

vim.lsp.enable({
  "lua_ls",
  "rust-analyzer",
  "gopls",
  "clangd",
  "vtsls",
  "vscode-json-language-server",
  "vscode-eslint-language-server",
  "vscode-html-language-server",
  "vscode-css-language-server",
})
