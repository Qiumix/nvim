local config = {
  show_count = true,
  maxkeys = 4,
}

return {
  "showkeys",
  after = function()
    local showkeys = require("showkeys")
    showkeys.setup(config)
    showkeys.open()
  end,
}
