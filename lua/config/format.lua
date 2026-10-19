---@module "conform"
---@type conform.setupOpts

local function should_format(bufnr)
  local ignore_filetypes = { "sql", "yaml", "yml" }
  if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
    return false
  end
  if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
    return false
  end
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  if bufname:match("/node_modules/") then
    return false
  end
  return true
end

return {
  formatters_by_ft = {
    asd = { "racketfmt" },
    astro = { "biome", "prettier", stop_after_first = true },
    bash = { "shfmt" },
    css = { "biome", "prettier", stop_after_first = true },
    go = { "gofmt", stop_after_first = true },
    html = { "biome", "prettier", stop_after_first = true },
    javascript = { "biome", "prettier", stop_after_first = true },
    javascriptreact = { "biome", "prettier", stop_after_first = true },
    jsonc = { "biome", "jq", "prettier", stop_after_first = true },
    json = { "biome", "jq", "prettier", stop_after_first = true },
    kdl = { "kdlfmt" },
    kotlin = { "ktlint" },
    lisp = { "racketfmt" },
    lua = { "stylua" },
    ["markdown.mdx"] = { "rumdl", "biome", "prettier", stop_after_first = true },
    markdown = { "rumdl", "biome", "prettier", stop_after_first = true },
    python = { "ruff_format", stop_after_first = true },
    ron = { "ronfmt" },
    rust = { "rustfmt" },
    scheme = { "racketfmt" },
    scss = { "biome", "prettier", stop_after_first = true },
    sh = { "shfmt" },
    steel = { "racketfmt" },
    svelte = { "biome", "prettier", stop_after_first = true },
    toml = { "taplo" },
    typescript = { "biome", "prettier", stop_after_first = true },
    typescriptreact = { "biome", "prettier", stop_after_first = true },
    typst = { "typstyle" },
    vue = { "biome", "prettier", stop_after_first = true },
    xml = { "xmllint", "prettier", stop_after_first = true },
    zig = { "zigfmt" },
  },

  formatters = {
    biome = {
      -- Keep this false so `condition` has full control over whether biome runs.
      require_cwd = false,
      condition = function(self, ctx)
        -- Lazy-load util only when this condition actually runs.
        local util = require("conform.util")

        -- Case 1: a Biome config exists somewhere up the tree -> run biome.
        local biome_cfg = util.root_file({
          "biome.json",
          "biome.jsonc",
          ".biome.json",
          ".biome.jsonc",
        })(self, ctx)

        if biome_cfg then
          return true
        end

        -- Lazy-load prettierd's cwd only when Biome config is missing.
        local prettierd_cwd = require("conform.formatters.prettierd").cwd

        -- Case 3 check: no Biome config, but a Prettier config exists -> skip
        -- biome so `stop_after_first` falls through to prettier.
        if prettierd_cwd(self, ctx) then
          return false
        end

        -- Case 2: neither config exists -> still run biome with built-in defaults.
        return true
      end,
    },
    kdlfmt = { command = "kdlfmt", args = { "format", "--kdl-version", "v1", "-" }, stdin = true },
    ronfmt = { command = "ronfmt", args = { "$FILENAME", "-d" } },
  },

  default_format_opts = {
    lsp_format = "fallback",
  },

  format_on_save = function(bufnr)
    if not should_format(bufnr) then
      return
    end
    return {
      lsp_format = "fallback",
      timeout_ms = 500,
    }
  end,
  format_after_save = function(bufnr)
    if not should_format(bufnr) then
      return
    end
    return {
      lsp_format = "fallback",
    }
  end,
}
