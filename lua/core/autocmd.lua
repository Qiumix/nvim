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
