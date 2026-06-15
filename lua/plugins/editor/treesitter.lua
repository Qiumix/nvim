local config = {
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

---@type lz.n.Spec
return {
  {
    "nvim-treesitter-textobjects",
    after = function()
      require("nvim-treesitter-textobjects").setup(config)
    end,
  },
  {
    "tree-sitter-manager.nvim",
    event = "DeferredUIEnter",
    after = function()
      require("tree-sitter-manager").setup()
    end,
  },
}
