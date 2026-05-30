---@type lz.n.PluginSpec
return {
  "render-markdown.nvim",
  ft = { "markdown", "norg", "org" },
  opts = {
    heading = {
      enabled = true,
      sign = true,
      icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
    },
    code = {
      enabled = true,
      sign = true,
      style = "full",
      left_pad = 1,
      right_pad = 1,
      language_pad = 1,
    },
    checkbox = {
      enabled = true,
      unchecked = { icon = "󰄱 " },
      checked = { icon = "󰄵 " },
    },
    bullet = {
      enabled = true,
      icons = { "●", "○", "◆", "◇" },
    },
  },
}
