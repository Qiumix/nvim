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
            local ok, mod = pcall(require, "colorful-menu")
            if ok then
              return mod.blink_components_text(ctx)
            end
            return ctx.label
          end,
          highlight = function(ctx)
            local ok, mod = pcall(require, "colorful-menu")
            if ok then
              return mod.blink_components_highlight(ctx)
            end
            return {}
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
    },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
}

return config
