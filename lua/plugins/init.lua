---@module "zpack"
---@type zpack.Spec[]
return {
  { import = "plugins.code" },
  { import = "plugins.completion" },
  { import = "plugins.edit" },
  { import = "plugins.langs" },
  { import = "plugins.tool" },
  { import = "plugins.ui" },
}
