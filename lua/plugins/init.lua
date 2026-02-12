only_require_without_vsc("plugins.blink")
only_require_without_vsc("plugins.conform")
only_require_without_vsc("plugins.git")
only_require_without_vsc("plugins.markdown")
only_require_without_vsc("plugins.treesitter")
only_require_without_vsc("plugins.whichkey")
only_require_without_vsc("plugins.ui")
require("plugins.yanky")
require("plugins.noice")
require("plugins.mini")
only_require_without_vsc("plugins.colorscheme")
only_require_without_vsc("plugins.lazydev")

-- require 'oil'.setup()
require 'crates'.setup()
require('kitty-scrollback').setup()
require 'FTerm'.setup({
  dimensions = {
    height = 0.8,
    width = 0.8,
  },
})

only_require_without_vsc 'which-key'.setup({
  preset = 'helix',
})
