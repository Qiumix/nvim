return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    version = "main",
    event = "UIEnter",
    opts = {
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
      swap = {
        enable = true,
        swap_next = {
          ["<leader>sw"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>sW"] = "@parameter.inner",
        },
      },
    },
  },
  {
    "romus204/tree-sitter-manager.nvim",
    version = "main",
    event = "VeryLazy",
    opts = {},
  },
}
