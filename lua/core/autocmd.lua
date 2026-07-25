local autocmd = vim.api.nvim_create_autocmd
local augroup = function(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Highlight on yank
autocmd("TextYankPost", {
  desc = "Highlight on yank",
  group = augroup("highlight_yank"),
  callback = function()
    vim.hl.hl_op()
  end,
})

-- Auto create dir when saving a file
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function(event)
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(event)
    local exclude = { "gitcommit" } -- don't remember position in commit messages
    local mark = vim.api.nvim_buf_get_mark(event.buf, '"')
    local lcount = vim.api.nvim_buf_line_count(event.buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Transparent background for blink.cmp
local aug = augroup("BlinkTransparent")
vim.api.nvim_create_autocmd("User", {
  group = aug,
  pattern = "BlinkCmpMenuOpen",
  once = true,
  callback = function()
    vim.api.nvim_set_hl(0, "BlinkCmpMenu", { link = "", bg = "NONE" })
    vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "", bg = "NONE" })
  end,
})
vim.api.nvim_create_autocmd("ColorScheme", {
  group = aug,
  callback = function()
    vim.api.nvim_set_hl(0, "BlinkCmpMenu", { link = "", bg = "NONE" })
    vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { link = "", bg = "NONE" })
  end,
})
