---@module "zpack"
---@type zpack.Spec|zpack.Spec[]
return {
  {
    "saecki/crates.nvim",
    ft = "toml",
    ---@type crates.UserConfig
    opts = {
      lsp = {
        actions = true,
        completion = true,
        enabled = true,
        hover = true,
      },
      popup = {
        autofocus = true,
        hide_on_select = true,
        show_version_date = true,
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    enabled = false,
    ft = "rust",
    config = function()
      vim.g.rustaceanvim = {}
    end,
  },
}
