---@type wk.Spec
return {
  -- ════════════════════════════════════════════════════════════
  --  PRE-DEFINED GROUPS & INITIAL SPECIFICATIONS
  -- ════════════════════════════════════════════════════════════
  { "<leader><tab>", group = "tabs", icon = { icon = "󰓩 ", color = "blue" } },
  { "<leader>t", group = "toggle", icon = { icon = "󰔡 ", color = "cyan" } },
  { "<leader>l", group = "language", icon = { icon = " ", color = "green" } },
  { "<leader>o", group = "opt", icon = { icon = "󰘮 ", color = "cyan" } },
  { "<leader>D", group = "Diffview", icon = { icon = "󰢪", color = "orange" } },
  { "<leader>g", group = "git", icon = { icon = " ", color = "purple" } },
  { "<leader>q", group = "quit/session", icon = { icon = "󰈆 ", color = "red" } },
  { "<leader>s", group = "search", icon = { icon = "󰍉 ", color = "yellow" } },
  { "[", group = "prev", icon = { icon = "󰅁 ", color = "azure" } },
  { "]", group = "next", icon = { icon = "󰅂 ", color = "azure" } },
  { "g", group = "goto/buffer", icon = { icon = "󰘸 ", color = "blue" } },
  { "s", group = "surround", icon = { icon = "󰖶 ", color = "grey" } },
  { "z", group = "fold", icon = { icon = "󰘖 ", color = "grey" } },
  {
    "<leader>b",
    group = "buffer",
    icon = { icon = "󰈙 ", color = "blue" },
    expand = function()
      return require("which-key.extras").expand.buf()
    end,
  },
  {
    "<leader>w",
    group = "windows",
    proxy = "<c-w>",
    icon = { icon = "󰖯 ", color = "cyan" },
    expand = function()
      return require("which-key.extras").expand.win()
    end,
  },
  { "gx", desc = "Open with system app", icon = { icon = "󰏌 ", color = "green" } },
  {
    "<leader>?",
    function()
      require("which-key").show({ global = true })
    end,
    desc = "Buffer Keymaps (which-key)",
    icon = { icon = "󰞋 ", color = "yellow" },
  },
}
