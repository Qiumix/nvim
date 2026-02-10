function only_require_without_vsc(plugin)
  if vim.g.vscode then
    return
  end
  require(plugin)
end

only_require_without_vsc("plugins.blink")
only_require_without_vsc("plugins.conform")
only_require_without_vsc("plugins.git")
only_require_without_vsc("plugins.markdown")
only_require_without_vsc("plugins.treesitter")
only_require_without_vsc("plugins.whichkey")
require("plugins.yanky")
require("plugins.mini")
only_require_without_vsc("plugins.catppuccin")
