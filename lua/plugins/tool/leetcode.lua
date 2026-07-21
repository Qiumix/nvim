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

local function has_arg(target)
  for _, arg in ipairs(vim.v.argv) do
    if arg == target then
      return true
    end
  end
  return false
end

---@module "zpack"
---@type zpack.Spec
return {
  "kawre/leetcode.nvim",
  dependencies = {
    "3rd/image.nvim",
    opts = {
      backend = "kitty",
    },
  },
  cmd = "Leet",
  lazy = not has_arg("leetcode.nvim"),
  opts = config,
}
