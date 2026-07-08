local config = {
  open_cmd = "floorp %s",
  -- port = 3340,
  host = "127.0.0.1",
  dependencies_bin = {
    -- ["tinymist"] = "/usr/bin/tinymist",
    -- ["websocat"] = "/usr/bin/websocat",
  },
}

---@type LznPackSpec
return {
  src = "chomosuke/typst-preview.nvim",
  ft = "typst",
  cmd = "TypstPreview",
  after = function()
    require("typst-preview").setup(config)
  end,
}
