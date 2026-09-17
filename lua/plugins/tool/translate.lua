---@module "zpack"
---@type zpack.Spec|zpack.Spec[]
return {
  {
    "askfiy/smart-translate.nvim",
    cmd = { "Translate" },
    event = "VeryLazy",
    opts = function()
      return require("config.translate")
    end,
    dependencies = {
      "askfiy/http.nvim", -- a wrapper implementation of the Python aiohttp library that uses CURL to send requests.
    },
  },
}
