return {
  {
    "saecki/crates.nvim",
    ft = "toml",
    config = function()
      require("crates").setup()
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    ft = "rust",
    config = function()
      vim.g.rustaceanvim = require("rustaceanvim.config.internal")
      vim.g.rustaceanvim.server.cmd = nil
    end,
  },
}