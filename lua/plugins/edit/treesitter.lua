local config = {
  move = {
    enable = true,
    set_jumps = true,
    goto_next_start = {
      ["]m"] = "@function.outer", -- 跳转到下一个函数开头
      ["]]"] = "@class.outer", -- 跳转到下一个类/结构体开头
    },
    goto_next_end = {
      ["]M"] = "@function.outer", -- 跳转到下一个函数结尾
      ["]["] = "@class.outer", -- 跳转到下一个类/结构体结尾
    },
    goto_previous_start = {
      ["[m"] = "@function.outer", -- 跳转到上一个函数开头
      ["[["] = "@class.outer", -- 跳转到上一个类/结构体开头
    },
    goto_previous_end = {
      ["[M"] = "@function.outer", -- 跳转到上一个函数结尾
      ["[]"] = "@class.outer", -- 跳转到上一个类/结构体结尾
    },
  },

  -- 参数/位置交换（可选，不要的话可以整块删掉）
  swap = {
    enable = true,
    swap_next = {
      ["<leader>sw"] = "@parameter.inner", -- 将当前参数与下一个参数对调
    },
    swap_previous = {
      ["<leader>sW"] = "@parameter.inner", -- 将当前参数与上一个参数对调
    },
  },
}

---@type LznPackSpec
return {
  {
    src = "nvim-treesitter/nvim-treesitter-textobjects",
    version = "main",
    event = "UIEnter",
    after = function()
      require("nvim-treesitter-textobjects").setup(config)
    end,
  },
  {
    src = "romus204/tree-sitter-manager.nvim",
    version = "main",
    event = "VeryLazy",
    after = function()
      require("tree-sitter-manager").setup()
    end,
  },
}
