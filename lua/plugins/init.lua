-- Bootstrap: install lz.n first
vim.pack.add({ { src = "https://github.com/lumen-oss/lz.n" } }, { confirm = false })

-- Collect pack specs from all categories for a single vim.pack.add call
local all_pack_specs = {}
local lazy_plugins = {}
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
  local specs, lazy_names = CollectPackSpecs(prefix)
  for _, s in ipairs(specs) do
    table.insert(all_pack_specs, s)
  end
  for name, _ in pairs(lazy_names) do
    lazy_plugins[name] = true
  end
end

-- Install & load all plugins
vim.pack.add(all_pack_specs, { confirm = false, load = false })

-- Register lazy-loading specs via lz.n with auto-derived [1]
for _, prefix in ipairs(spec_categories) do
  LznLoadSpecs(prefix)
end

-- Remove lazy plugins from rtp so Neovim's RTP scan doesn't source their plugin/ files at startup.
-- When a lazy trigger fires, lz.n calls :packadd name which adds them back and sources plugin/ files.
local data = vim.fn.stdpath("data")
for name, _ in pairs(lazy_plugins) do
  local base = data .. "/site/pack/core/opt/" .. name
  vim.opt.rtp:remove(base)
  vim.opt.rtp:remove(base .. "/after")
end

-- Load gruvbox for the colorscheme
vim.cmd("colorscheme gruvbox")
