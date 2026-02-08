vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.signcolumn = "yes"
vim.o.showtabline = 2
vim.o.winborder = "rounded"
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>o', "<cmd>source<CR>")
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
	{ src = gh("catppuccin/nvim") },
	{ src = gh("tribela/transparent.nvim") },
	{ src = gh("stevearc/oil.nvim") },
	{ src = gh("neovim/nvim-lspconfig") },
	{ src = gh("echasnovski/mini.pick") },
	{ src = gh('Saghen/blink.cmp'),        version = vim.version.range('*') }
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/completion') then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

require 'mini.pick'.setup()
require 'oil'.setup()
vim.cmd("colorscheme catppuccin")
vim.cmd("hi statusline guibg=NONE")

vim.lsp.enable({
	"lua_ls",
})
