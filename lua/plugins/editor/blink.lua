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
