---@module "conform"
---@type conform.setupOpts
return {
  formatters_by_ft = {
    lua = { "stylua" },
    bash = { "shfmt" },
    sh = { "shfmt" },
    zig = { "zig" },
    rust = { "rustfmt" },
    go = { "goimports", "gofmt", stop_after_first = true },
    python = { "ruff_format", "isort", "black", stop_after_first = true },
    json = { "biome", "prettier", stop_after_first = true },
    jsonc = { "biome", "prettier", stop_after_first = true },
    markdown = { "biome", "prettier", stop_after_first = true },
    ["markdown.mdx"] = { "biome", "prettier", stop_after_first = true },
    javascript = { "biome", "prettier", stop_after_first = true },
    typescript = { "biome", "prettier", stop_after_first = true },
    javascriptreact = { "biome", "prettier", "dprint", stop_after_first = true },
    typescriptreact = { "biome", "prettier", "dprint", stop_after_first = true },
    svelte = { "biome", "prettier", "dprint", stop_after_first = true },
    css = { "biome", "prettier", stop_after_first = true },
    scss = { "biome", "prettier", stop_after_first = true },
    html = { "biome", "prettier", stop_after_first = true },
    vue = { "biome", "prettier", stop_after_first = true },
    astro = { "biome", "prettier", stop_after_first = true },
    xml = { "xmllint", "prettier", stop_after_first = true },
    lisp = { "lisp_fmt" },
    asd = { "lisp_fmt" },
    ros = { "lisp_fmt" },
    kdl = { "kdlfmt" },
    scheme = { "lisp_fmt" },
    steel = { "lisp_fmt" },
    toml = { "taplo" },
    nix = { "nixfmt" },
    typst = { "tinymist", "typstyle" },
    csv = { "xsv" },
  },

  formatters = {
    biome = { require_cwd = true },
    xsv = {
      command = "xsv",
      args = { "fmt" },
    },
    deno_fmt = { require_cwd = true },
    kdlfmt = {
      command = "kdlfmt",
      args = { "format", "--kdl-version", "v1", "-" },
      stdin = true,
    },
    lisp_fmt = {
      command = "raco",
      args = { "fmt" },
      stdin = true,
    },
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
