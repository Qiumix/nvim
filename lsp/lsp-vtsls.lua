return {
  cmd = { "vtsls", "--stdio" },
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
  root_markers = { "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lockb", ".git" },
  init_options = {
    hostInfo = "neovim",
  },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          {
            name = "@vue/typescript-plugin",
            languages = { "vue" },
            configNamespace = "typescript",
            enableForWorkspaceTypeScriptVersions = true,
          },
        },
      },
    },
  },
}
