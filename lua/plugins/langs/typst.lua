local config = {
  open_cmd = "floorp %s",
  -- port = 3340,
  host = "127.0.0.1",
  dependencies_bin = {
    -- ["tinymist"] = "/usr/bin/tinymist",
    -- ["websocat"] = "/usr/bin/websocat",
  },
}

---@module "zpack"
---@type zpack.Spec
return {
  "chomosuke/typst-preview.nvim",
  ft = "typst",
  cmd = "TypstPreview",
  opts = config,
  config = function(_, opts)
    require("typst-preview").setup(opts)
  end,
}
