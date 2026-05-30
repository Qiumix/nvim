---@type lz.n.PluginSpec
return {
  "typst-preview.nvim",
  ft = "typst",
  after = function()
    require("typst-preview").setup({
      dependencies_bin = {
        ["tinymist"] = "/usr/bin/tinymist",
        ["websocat"] = "/usr/bin/websocat",
      },
    })
  end,
}
