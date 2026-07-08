---@type LznPackSpec
return {
  src = "nvim-mini/mini.nvim",
  name = "mini.ai",
  event = "DeferredUIEnter",
  after = function()
    local ai = require("mini.ai")
    local spec_treesitter = ai.gen_spec.treesitter
    ai.setup({
      custom_textobjects = {
        -- 1. 挂载 Treesitter 文本对象，让 mini.ai 统一管理
        -- vaf / vif 选择整个函数/内部，vaF / viF 选择类
        f = spec_treesitter({ a = "@function.outer", i = "@function.inner" }),
        F = spec_treesitter({ a = "@class.outer", i = "@class.inner" }),
        -- 条件分支/循环（ vao / vio）
        o = spec_treesitter({
          a = { "@conditional.outer", "@loop.outer" },
          i = { "@conditional.inner", "@loop.inner" },
        }),

        a = spec_treesitter({ a = "@parameter.outer", i = "@parameter.inner" }),
      },
      n_lines = 100,
      -- 搜索模式：优先覆盖当前光标，找不到就找下一个
      search_method = "cover_or_next",
    })
  end,
}
