local config = require("plugins.editor.formater.config")

return {
  "conform.nvim",
  after = function()
    require("conform").setup(config)
  end,
}
