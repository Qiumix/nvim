-- Bootstrap: install lz.n first
vim.pack.add({ { src = "https://github.com/lumen-oss/lz.n" } }, { confirm = false })

local lzn = require("lz.n")

-- Collect pack specs from all categories for a single vim.pack.add call
local all_pack_specs = {}
for _, prefix in ipairs({ "plugins.mini", "plugins.editor", "plugins.ui", "plugins.langs" }) do
  local specs = CollectPackSpecs(prefix)
  for _, s in ipairs(specs) do
    table.insert(all_pack_specs, s)
  end
end

-- Install & load all plugins
vim.pack.add(all_pack_specs, { confirm = false })

-- Register lazy-loading specs via lz.n with auto-derived [1]
LznLoadSpecs("plugins.mini")
LznLoadSpecs("plugins.editor")
LznLoadSpecs("plugins.ui")
LznLoadSpecs("plugins.langs")

-- Load gruvbox for the colorscheme
vim.cmd("packadd gruvbox.nvim")
vim.cmd("colorscheme gruvbox")
