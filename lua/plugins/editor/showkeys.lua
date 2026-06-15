local config = {
  show_count = true,
  maxkeys = 4,
}

---@type lz.n.Spec
return {
  "showkeys",
  event = "DeferredUIEnter",
  after = function()
    local showkeys = require("showkeys")
    showkeys.setup(config)
    showkeys.open()
  end,
}
