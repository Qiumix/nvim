---@type wk.Spec
return {
  { "<leader><tab>", group = "tabs", icon = "󰓩 " },
  { "<leader>l", group = "language", icon = " " },
  { "<leader>D", group = "Diffview", icon = { icon = "", color = "orange" } },
  { "<leader>g", group = "git" },
  { "<leader>q", group = "quit/session" },
  { "<leader>s", group = "search" },
  { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
  { "[", group = "prev" },
  { "]", group = "next" },
  { "g", group = "goto" },
  { "s", group = "surround" },
  { "z", group = "fold" },
  {
    "<leader>b",
    group = "buffer",
    expand = function()
      return require("which-key.extras").expand.buf()
    end,
  },
  {
    "<leader>w",
    group = "windows",
    proxy = "<c-w>",
    expand = function()
      return require("which-key.extras").expand.win()
    end,
  },
  -- better descriptions
  { "gx", desc = "Open with system app" },
  {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = true })
      end,
      desc = "Buffer Keymaps (which-key)",
    },
  },
}
