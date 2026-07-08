local signature = {
  enabled = true,
  window = { border = "rounded" },
}

local completion = {
  documentation = { auto_show = true },
  menu = {
    draw = {
      columns = { { "kind_icon" }, { "label", gap = 1 } },
      components = {
        label = {
          text = function(ctx)
            return require("colorful-menu").blink_components_text(ctx)
          end,
          highlight = function(ctx)
            return require("colorful-menu").blink_components_highlight(ctx)
          end,
        },
      },
    },
  },
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
    default = {
      "lsp",
      "snippets",
      "path",
      "buffer",
      --   "minuet"
    },
    providers = {
      minuet = {
        name = "minuet",
        module = "minuet.blink",
        async = true,
        -- Should match minuet.config.request_timeout * 1000,
        -- since minuet.config.request_timeout is in seconds
        timeout_ms = 3000,
        score_offset = 50, -- Gives minuet higher priority among suggestions
      },
    },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
}

return config
