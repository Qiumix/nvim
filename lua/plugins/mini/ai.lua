---@type LznPackSpec
return {
  src = "nvim-mini/mini.ai",
  event = "DeferredUIEnter",
  after = function()
    local ai = require("mini.ai")
    local spec_treesitter = ai.gen_spec.treesitter
    ai.setup({
      custom_textobjects = {
        -- Treesitter text object
        -- vaf / vif for function，vaF / viF for class
        f = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
        F = spec_treesitter({ a = "@class.outer", i = "@class.inner" }),
        -- conditional branch / loop（ vao / vio）
        o = spec_treesitter({
          a = { "@conditional.outer", "@loop.outer" },
          i = { "@conditional.inner", "@loop.inner" },
        }),

        a = spec_treesitter({ a = "@parameter.outer", i = "@parameter.inner" }),
      },
      n_lines = 100,
      search_method = "cover_or_next",
    })
  end,
}
