vim.pack.add({ { src = "https://github.com/zuqini/zpack.nvim" } })
require("core.options")
require("core.autocmd")
require("core.usercmd")
require("zpack").setup()
vim.api.nvim_create_autocmd("FileType", {
  once = true,
  callback = function()
    require("core.lsp")
  end,
})
