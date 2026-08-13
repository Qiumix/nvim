---@module "snacks"
---@type snacks.Config
return {
  animate = { enabled = true },
  bigfile = { enabled = true, size = 500 * 1024 },
  dashboard = { enabled = false },
  dim = { enabled = true },
  explorer = { enabled = true, replace_netrw = true },
  image = {
    enabled = true,
    math = {
      typst = {
        tpl = [[
        #set page(width: auto, height: auto, margin: (x: 2pt, y: 2pt))
        #show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")
        #set text(size: 12pt, fill: rgb("#83a598"))
        ${header}
        ${content}]],
      },
    },
  },
  indent = { enabled = false },
  input = { enabled = true },
  layout = { enabled = true },
  notifier = { enabled = false },
  quickfile = { enabled = true },
  scope = { enabled = true },
  scratch = { enabled = true },
  scroll = { enabled = false },
  statuscolumn = { enabled = true },
  terminal = { enabled = true },
  toggle = { enabled = true },
  words = { enabled = false },
  zen = { enabled = true },
  picker = {
    sources = {
      explorer = {
        layout = { preset = "sidebar", preview = "main" },
        auto_close = false,
        jump = { close = false },
      },
    },
  },
}
