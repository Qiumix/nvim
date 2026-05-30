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

return {
  ---@type lz.n.PluginSpec
  {
    "nvim-treesitter-textobjects",
    after = function()
      require("nvim-treesitter-textobjects").setup(config)
    end,
  },
  ---@type lz.n.PluginSpec
  {
    "tree-sitter-manager.nvim",
    cmd = { "TSManager", "TSInstall", "TSUninstall" },
    after = function()
      require("tree-sitter-manager").setup()
    end,
  },
}
