local config = {
  show_count = true,
  maxkeys = 4,
}

---@module "zpack"
---@type zpack.Spec
return {
  "nvzone/showkeys",
  event = "VeryLazy",
  opts = config,
  config = function(_, opts)
    local showkeys = require("showkeys")
    showkeys.setup(opts)
    showkeys.open()
  end,
}
