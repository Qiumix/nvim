return {
  "nvim-mini/mini.ai",
  lazy = true,
  event = { "BufReadPre", "BufNewFile", "BufWritePre" },
  after = function()
    require("mini.ai").setup()
  end,
}
