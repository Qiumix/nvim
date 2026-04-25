local keymap = {
  preset = "default",
  ["<C-u>"] = { "scroll_documentation_up", "fallback" },
  ["<C-d>"] = { "scroll_documentation_down", "fallback" },
}

local signature = {
  enabled = true,
  window = { border = "rounded" },
}

local completion = {
  documentation = { auto_show = true },
}

local cmdline = {
  completion = {
    menu = {
      auto_show = true,
    },
  },
}

local config = {
  keymap = keymap,
  signature = signature,
  completion = completion,
  cmdline = cmdline,
  appearance = {
    nerd_font_variant = "mono",
    use_nvim_cmp_as_default = true,
  },
  sources = {
    default = { "snippets", "lsp", "path", "buffer" },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
}

return {
  "blink.cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  after = function()
    require("blink.cmp").setup(config)
  end,
}
