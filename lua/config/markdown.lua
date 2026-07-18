---@module "render-markdown"
---@type render.md.UserConfig
return {
  code = {
    conceal_delimiters = true,
    border = "none",
  },
  win_options = {
    conceallevel = {
      default = vim.o.conceallevel,
      rendered = 2,
    },
  },
  anti_conceal = {
    enabled = true,
    ignore = {
      code_background = true,
    },
  },
}
