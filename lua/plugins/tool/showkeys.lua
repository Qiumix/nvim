local config = {
  show_count = true,
  maxkeys = 4,
}

return {
  "nvzone/showkeys",
  event = "VeryLazy",
  config = function()
    local showkeys = require("showkeys")
    showkeys.setup(config)
    showkeys.open()
  end,
}
