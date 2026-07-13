---@type LznPackSpec
return {
  {
    src = "saecki/crates.nvim",
    ft = "toml",
    after = function()
      require("crates").setup()
    end,
  },
  {
    src = "mrcjkb/rustaceanvim",
    ft = "rust",
    after = function()
      vim.g.rustaceanvim = require("rustaceanvim.config.internal")
      vim.g.rustaceanvim.server.cmd = nil
    end,
  },
}
