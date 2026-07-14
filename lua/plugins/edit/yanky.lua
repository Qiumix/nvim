---@module "zpack"
---@type zpack.Spec
return {
  "gbprod/yanky.nvim",
  event = "VeryLazy",
  dependencies = {
    "kkharji/sqlite.lua",
  },
  opts = {
    ring = { storage = "sqlite" },
    textobj = {
      enabled = true,
    },
  },
}
