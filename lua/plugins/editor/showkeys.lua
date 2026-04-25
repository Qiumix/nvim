return {
  "showkeys",
  after = function()
    local showkeys = require("showkeys")
    showkeys.setup({
      show_count = true,
      maxkeys = 4,
    })
    showkeys.open()
  end,
}
