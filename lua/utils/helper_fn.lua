--- Scans a directory, executes all Lua files within it, and merges their
--- returned values into a single sequential table (array).
---@param dir_path string
---@return table
function Merge(dir_path)
  local result = {}
  for name, typ in vim.fs.dir(dir_path) do
    if typ == "file" and name:match("%.lua$") then
      local file_table = loadfile(dir_path .. "/" .. name)()
      table.insert(result, file_table)
    end
  end
  return result
end

--- Automatically requires all Lua sub-modules within a given module directory.
---@param mod_prefix string
function Load(mod_prefix)
  local dir_path = vim.fn.stdpath("config") .. "/lua/" .. mod_prefix:gsub("%.", "/")
  for name, typ in vim.fs.dir(dir_path) do
    if typ == "file" and name:match("%.lua$") then
      local sub_mod = name:gsub("%.lua$", "")
      require(mod_prefix .. "." .. sub_mod)
    end
  end
end
