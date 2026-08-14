---@module "conform"
---@type conform.setupOpts
return {
  formatters_by_ft = {
    asd = { "lisp_fmt" },
    astro = { "biome", "prettier", stop_after_first = true },
    bash = { "shfmt" },
    css = { "biome", "prettier", stop_after_first = true },
    csv = { "xsv" },
    go = { "goimports", "gofmt", stop_after_first = true },
    html = { "biome", "prettier", stop_after_first = true },
    javascript = { "biome", "prettier", stop_after_first = true },
    javascriptreact = { "biome", "prettier", "dprint", stop_after_first = true },
    json = { "biome", "prettier", stop_after_first = true },
    jsonc = { "biome", "prettier", stop_after_first = true },
    kdl = { "kdlfmt" },
    lisp = { "lisp_fmt" },
    lua = { "stylua" },
    markdown = { "biome", "prettier", stop_after_first = true },
    ["markdown.mdx"] = { "biome", "prettier", stop_after_first = true },
    nix = { "nixfmt" },
    python = { "ruff_format", "isort", "black", stop_after_first = true },
    ron = { "ronfmt" },
    rust = { "rustfmt" },
    scheme = { "lisp_fmt" },
    scss = { "biome", "prettier", stop_after_first = true },
    sh = { "shfmt" },
    steel = { "lisp_fmt" },
    svelte = { "biome", "prettier", "dprint", stop_after_first = true },
    toml = { "taplo" },
    typescript = { "biome", "prettier", stop_after_first = true },
    typescriptreact = { "biome", "prettier", "dprint", stop_after_first = true },
    typst = { "tinymist", "typstyle" },
    vue = { "biome", "prettier", stop_after_first = true },
    xml = { "xmllint", "prettier", stop_after_first = true },
    zig = { "zig" },
  },

  formatters = {
    biome = { require_cwd = true },
    deno_fmt = { require_cwd = true },
    kdlfmt = { command = "kdlfmt", args = { "format", "--kdl-version", "v1", "-" }, stdin = true },
    lisp_fmt = { command = "raco", args = { "fmt" }, stdin = true },
    ronfmt = { command = "ronfmt", args = { "$FILENAME", "-d" } },
    xsv = { command = "xsv", args = { "fmt" } },
  },

  default_format_opts = {
    lsp_format = "fallback",
  },

  format_on_save = function(bufnr)
    local ignore_filetypes = { "sql", "yaml", "yml" }
    if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
      return
    end
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    local bufname = vim.api.nvim_buf_get_name(bufnr)
    if bufname:match("/node_modules/") then
      return
    end
    return { timeout_ms = 500, lsp_format = "fallback" }
  end,
}
