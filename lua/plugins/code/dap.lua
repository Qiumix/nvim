---@module "zpack"
---@type zpack.Spec
return {
  "mfussenegger/nvim-dap",
  lazy = false,
  config = function()
    local dap = require("dap")

    -- ── Load adapters from lua/dap/*.lua ────────────────────────

    local dap_dir = vim.fn.stdpath("config") .. "/lua/dap"
    for name, typ in vim.fs.dir(dap_dir) do
      if typ == "file" and name:match("%.lua$") then
        local ok, cfg = pcall(dofile, dap_dir .. "/" .. name)
        if ok and type(cfg) == "table" and cfg.dbg then
          local key = cfg.dbg
          cfg.dbg = nil
          dap.adapters[key] = cfg
        end
      end
    end

    -- ── Load language configs from lua/dap_lang/*.lua ───────────

    local lang_dir = vim.fn.stdpath("config") .. "/lua/dap_lang"
    for name, typ in vim.fs.dir(lang_dir) do
      if typ == "file" and name:match("%.lua$") and name ~= "util.lua" then
        local lang = name:gsub("%.lua$", "")
        local ok, cfgs = pcall(dofile, lang_dir .. "/" .. name)
        if ok and type(cfgs) == "table" then
          dap.configurations[lang] = cfgs
        end
      end
    end

    -- ── Auto-open/close handled by dap-view auto_toggle ──────
  end,
}
