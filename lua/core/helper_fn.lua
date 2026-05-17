--- Scans a directory, executes all Lua files within it, and merges their
--- returned values into a single sequential table (array).
---
--- This function assumes each Lua file in the target directory returns a table
--- (e.g., `return { src = "..." }`). It collects these tables and inserts them
--- into a master list, resulting in a structure like `{{src=}, {src=}}`.
---
---@param dir_path string The absolute path to the directory to scan (e.g., `/path/to/dir`).
---@return table An array containing the tables returned by each individual Lua file.
function Merge(dir_path)
  local result = {}
  for name, type in vim.fs.dir(dir_path) do
    if type == "file" and name:match("%.lua$") then
      local file_table = loadfile(dir_path .. "/" .. name)()
      table.insert(result, file_table)
    end
  end
  return result
end

--- Automatically requires all Lua sub-modules within a given module directory.
--- It scans the physical directory corresponding to the module prefix and
--- registers each file via the standard `require()` function.
---
---@param mod_prefix string The Lua module dot-notation prefix (e.g., `plugins.config`).
function Load(mod_prefix)
  local dir_path = vim.fn.stdpath("config") .. "/lua/" .. mod_prefix:gsub("%.", "/")

  for name, type in vim.fs.dir(dir_path) do
    if type == "file" and name:match("%.lua$") then
      local sub_mod = name:gsub("%.lua$", "")
      require(mod_prefix .. "." .. sub_mod)
    end
  end
end
