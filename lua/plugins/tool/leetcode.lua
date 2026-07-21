local config = {
  ---@module "leetcode"
  cn = {
    enabled = true, ---@type boolean
    translator = true, ---@type boolean
    translate_problems = true, ---@type boolean
  },

  ---@type lc.picker
  picker = { provider = "snacks-picker" },

  ---@type boolean
  image_support = false,
}

---@module "zpack"
---@type zpack.Spec
return {
  "kawre/leetcode.nvim",
  -- dependencies = {
  --   "3rd/image.nvim",
  --   opts = {
  --     backend = ({
  --       ["xterm-kitty"] = "kitty",
  --       ["foot"] = "sixel",
  --     })[vim.env.TERM],
  --     integrations = {},
  --     window_overlap_clear_enabled = false,
  --     editor_only_render_when_focused = true,
  --   },
  -- },
  cmd = "Leet",
  lazy = not table.concat(vim.v.argv, " "):match("leetcode%.nvim"),
  opts = config,
}
