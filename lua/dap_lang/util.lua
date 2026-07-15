local rules = {
  rust = function(root)
    local cargo = vim.fn.readfile(root .. "/Cargo.toml", "", 20) or {}
    for _, line in ipairs(cargo) do
      local name = line:match('name%s*=%s*"([^"]+)"')
      if name then
        local path = root .. "/target/debug/" .. name
        if vim.fn.executable(path) == 1 then
          return path
        end
        return root .. "/target/debug/"
      end
    end
    return root .. "/target/debug/"
  end,
  c = function(root)
    if vim.fn.filereadable(root .. "/CMakeLists.txt") == 1 then
      return root .. "/build/"
    end
    return nil
  end,
  cpp = "c",
  zig = function(root)
    return root .. "/zig-out/bin/"
  end,
}

local fallback = function(root)
  return vim.fn.input("Path to executable: ", root .. "/target/debug/", "file")
end

---@return string
local function auto_executable()
  local root = vim.fs.root(0, { "Cargo.toml", "CMakeLists.txt", "build.zig", "go.mod", "package.json", ".git" })
    or vim.fn.getcwd()
  local rule = rules[vim.bo.filetype]
  if type(rule) == "string" then
    rule = rules[rule]
  end
  if type(rule) == "function" then
    local result = rule(root)
    if result then
      return result
    end
  end
  return fallback(root)
end

return { auto_executable = auto_executable }
