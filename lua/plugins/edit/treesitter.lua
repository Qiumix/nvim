---@module "zpack"
---@type zpack.Spec|zpack.Spec[]
return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    version = "main",
    event = "VeryLazy",
    opts = require("config.textobject"),
    config = function(_, opts)
      -- This plugin has no auto-setup hook: options go to setup(), and every
      -- mapping is registered by hand below.
      require("nvim-treesitter-textobjects").setup(opts)

      local select = require("nvim-treesitter-textobjects.select")
      local swap = require("nvim-treesitter-textobjects.swap")
      local move = require("nvim-treesitter-textobjects.move")
      local repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

      local group = "textobjects"

      -- { lhs, capture, description }
      local selects = {
        { "af", "@function.outer", "Select function outer" },
        { "if", "@function.inner", "Select function inner" },
        { "ac", "@class.outer", "Select class outer" },
        { "ic", "@class.inner", "Select class inner" },
        { "aa", "@parameter.outer", "Select parameter outer" },
        { "ia", "@parameter.inner", "Select parameter inner" },
        { "ao", "@conditional.outer", "Select conditional outer" },
        { "io", "@conditional.inner", "Select conditional inner" },
      }
      for _, item in ipairs(selects) do
        local lhs, capture, desc = item[1], item[2], item[3]
        vim.keymap.set({ "x", "o" }, lhs, function()
          select.select_textobject(capture, group)
        end, { desc = desc })
      end

      -- { lhs, fn, capture, description }
      local jumps = {
        { "]m", move.goto_next_start, "@function.outer", "Next function start" },
        { "]M", move.goto_next_end, "@function.outer", "Next function end" },
        { "[m", move.goto_previous_start, "@function.outer", "Previous function start" },
        { "[M", move.goto_previous_end, "@function.outer", "Previous function end" },
        { "]j", move.goto_next_start, "@class.outer", "Next class start" },
        { "]J", move.goto_next_end, "@class.outer", "Next class end" },
        { "[j", move.goto_previous_start, "@class.outer", "Previous class start" },
        { "[J", move.goto_previous_end, "@class.outer", "Previous class end" },
      }
      for _, jump in ipairs(jumps) do
        local lhs, fn, capture, desc = jump[1], jump[2], jump[3], jump[4]
        vim.keymap.set({ "n", "x", "o" }, lhs, function()
          fn(capture, group)
        end, { desc = desc })
      end

      -- Swap neighbouring parameters.
      vim.keymap.set("n", "<leader>sw", function()
        swap.swap_next("@parameter.inner")
      end, { desc = "Swap next parameter" })
      vim.keymap.set("n", "<leader>sW", function()
        swap.swap_previous("@parameter.outer")
      end, { desc = "Swap previous parameter" })

      -- Repeat the last jump with `;` and `,`.
      vim.keymap.set({ "n", "x", "o" }, ";", repeat_move.repeat_last_move_next)
      vim.keymap.set({ "n", "x", "o" }, ",", repeat_move.repeat_last_move_previous)
    end,
  },
  {
    "romus204/tree-sitter-manager.nvim",
    version = "main",
    lazy = false,
    ---@module "tree-sitter-manager"
    ---@type tree_sitter_manager.Config
    opts = {
      languages = {
        wesl = {
          install_info = {
            url = "https://github.com/webgpu-tools/tree-sitter-wesl",
            queries = "queries",
          },
        },
      },
    },
  },
}
