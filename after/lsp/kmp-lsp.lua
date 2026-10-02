---@type vim.lsp.Config
return {
  cmd = { "kmp-lsp" },
  filetypes = { "kotlin", "java", "swift" },
  root_dir = vim.fs.root(0, function(name, path)
    return name == "build.gradle"
      or name == "build.gradle.kts"
      or name == "pom.xml"
      or name == "settings.gradle"
      or name == "settings.gradle.kts"
      or name == "Package.swift"
      or name == ".git"
  end),
  settings = {},
}
