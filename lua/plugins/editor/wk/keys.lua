---@type wk.Spec
return {
  { "<leader><tab>", group = "tabs", icon = "󰓩 " },
  { "<leader>t", group = "toggle", icon = " " },
  { "<leader>l", group = "language", icon = " " },
  { "<leader>D", group = "Diffview", icon = { icon = "", color = "orange" } },
  { "<leader>g", group = "git" },
  { "<leader>q", group = "quit/session" },
  { "<leader>s", group = "search" },
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
  { "gx", desc = "Open with system app", icon = "󰏌 " },
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
