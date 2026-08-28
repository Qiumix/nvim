---@module "zpack"
---@type zpack.Spec|zpack.Spec[]
return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    version = "main",
    event = "UIEnter",
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          enable = true,
          lookahead = true,
          selection_modes = {
            ["@parameter.outer"] = "v",
            ["@function.outer"] = "V",
            ["@class.outer"] = "V",
          },
          include_surrounding_whitespace = false,
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>sw"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>sW"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
      })

      local select = require("nvim-treesitter-textobjects.select")
      local swap = require("nvim-treesitter-textobjects.swap")
      local move = require("nvim-treesitter-textobjects.move")
      local repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

      -- Select text objects
      vim.keymap.set({ "x", "o" }, "af", function()
        select.select_textobject("@function.outer", "textobjects")
      end, { desc = "Select function outer" })
      vim.keymap.set({ "x", "o" }, "if", function()
        select.select_textobject("@function.inner", "textobjects")
      end, { desc = "Select function inner" })
      vim.keymap.set({ "x", "o" }, "ac", function()
        select.select_textobject("@class.outer", "textobjects")
      end, { desc = "Select class outer" })
      vim.keymap.set({ "x", "o" }, "ic", function()
        select.select_textobject("@class.inner", "textobjects")
      end, { desc = "Select class inner" })
      vim.keymap.set({ "x", "o" }, "aa", function()
        select.select_textobject("@parameter.outer", "textobjects")
      end, { desc = "Select parameter outer" })
      vim.keymap.set({ "x", "o" }, "ia", function()
        select.select_textobject("@parameter.inner", "textobjects")
      end, { desc = "Select parameter inner" })

      -- Swap
      vim.keymap.set("n", "<leader>sw", function()
        swap.swap_next("@parameter.inner")
      end, { desc = "Swap next parameter" })
      vim.keymap.set("n", "<leader>sW", function()
        swap.swap_previous("@parameter.outer")
      end, { desc = "Swap previous parameter" })

      -- Move
      vim.keymap.set({ "n", "x", "o" }, "]m", function()
        move.goto_next_start("@function.outer", "textobjects")
      end, { desc = "Next function start" })
      vim.keymap.set({ "n", "x", "o" }, "]]", function()
        move.goto_next_start("@class.outer", "textobjects")
      end, { desc = "Next class start" })
      vim.keymap.set({ "n", "x", "o" }, "]M", function()
        move.goto_next_end("@function.outer", "textobjects")
      end, { desc = "Next function end" })
      vim.keymap.set({ "n", "x", "o" }, "][", function()
        move.goto_next_end("@class.outer", "textobjects")
      end, { desc = "Next class end" })
      vim.keymap.set({ "n", "x", "o" }, "[m", function()
        move.goto_previous_start("@function.outer", "textobjects")
      end, { desc = "Previous function start" })
      vim.keymap.set({ "n", "x", "o" }, "[[", function()
        move.goto_previous_start("@class.outer", "textobjects")
      end, { desc = "Previous class start" })
      vim.keymap.set({ "n", "x", "o" }, "[M", function()
        move.goto_previous_end("@function.outer", "textobjects")
      end, { desc = "Previous function end" })
      vim.keymap.set({ "n", "x", "o" }, "[]", function()
        move.goto_previous_end("@class.outer", "textobjects")
      end, { desc = "Previous class end" })

      -- Repeatable moves with ; and ,
      vim.keymap.set({ "n", "x", "o" }, ";", repeat_move.repeat_last_move_next)
      vim.keymap.set({ "n", "x", "o" }, ",", repeat_move.repeat_last_move_previous)
    end,
  },
  {
    "romus204/tree-sitter-manager.nvim",
    version = "main",
    lazy = false,
    ---@module "tree-sitter-manager"
    ---@type tree-sitter-manager.Config
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
