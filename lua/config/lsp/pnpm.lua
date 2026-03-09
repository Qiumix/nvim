vim.lsp.config('vue-ls', { -- 这里你可以叫它 vue-ls
  cmd = { "vue-language-server", "--stdio" },
  filetypes = { 'vue' },
  root_markers = { 'package.json', 'tsconfig.json', 'vite.config.ts' },
  init_options = {
    vue = {
      hybridMode = true,
    },
  },
})

-- 别忘了激活
vim.lsp.enable('vue-ls')
