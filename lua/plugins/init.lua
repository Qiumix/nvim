-- Bootstrap: install lz.n first
vim.pack.add({ { src = "https://github.com/lumen-oss/lz.n" } }, { confirm = false })

-- Collect pack specs from all categories for a single vim.pack.add call
local all_pack_specs = {}
local spec_categories = {
  "plugins.deps",
  "plugins.mini",
  "plugins.code",
  "plugins.completion",
  "plugins.edit",
  "plugins.file",
  "plugins.tool",
  "plugins.ui",
  "plugins.langs",
}
for _, prefix in ipairs(spec_categories) do
  local specs = CollectPackSpecs(prefix)
  for _, s in ipairs(specs) do
    table.insert(all_pack_specs, s)
  end
end

-- Install & load all plugins
vim.pack.add(all_pack_specs, { confirm = false, load = false })

-- Register lazy-loading specs via lz.n with auto-derived [1]
for _, prefix in ipairs(spec_categories) do
  LznLoadSpecs(prefix)
end

-- Load gruvbox for the colorscheme
vim.cmd("colorscheme gruvbox")
