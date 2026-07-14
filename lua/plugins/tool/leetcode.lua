local config = {
  ---@type lc.lang
  lang = "cpp",

  cn = {
    enabled = true, ---@type boolean
    translator = true, ---@type boolean
    translate_problems = true, ---@type boolean
  },

  ---@type table<string, boolean>
  plugins = {
    non_standalone = false,
  },

  injector = {}, ---@type table<lc.lang, lc.inject>

  ---@type lc.picker
  picker = { provider = "snacks-picker" },

  ---@type boolean
  image_support = true,
}

---@module "zpack"
---@type zpack.Spec
return {
  "kawre/leetcode.nvim",
  cmd = "Leet",
  opts = config,
}
