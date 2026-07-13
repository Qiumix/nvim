---@module "zpack"
---@type zpack.Spec

return {
  "nvim-mini/mini.ai",
  event = "VeryLazy",
  opts = function()
    local ai = require("mini.ai")
    local spec_treesitter = ai.gen_spec.treesitter
    return {
      custom_textobjects = {
        f = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
        F = spec_treesitter({ a = "@class.outer", i = "@class.inner" }),
        o = spec_treesitter({
          a = { "@conditional.outer", "@loop.outer" },
          i = { "@conditional.inner", "@loop.inner" },
        }),
        a = spec_treesitter({ a = "@parameter.outer", i = "@parameter.inner" }),
      },
      n_lines = 100,
      search_method = "cover_or_next",
    }
  end,
}
