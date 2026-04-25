local tables = {
  select = {
    enable = true,
    lookahead = true,
    selection_modes = {
      ["@parameter.outer"] = "v", -- charwise
      ["@function.outer"] = "V", -- linewise
      ["@class.outer"] = "<c-v>", -- blockwise
    },
    include_surrounding_whitespace = false,
  },
  move = {
    enable = true,
    set_jumps = true,
  },
}

return {
  {
    "nvim-treesitter-textobjects",
    after = function()
      require("nvim-treesitter-textobjects").setup(tables)
    end,
  },
  {
    "tree-sitter-manager.nvim",
    after = function()
      require("tree-sitter-manager").setup()
    end,
  },
}
