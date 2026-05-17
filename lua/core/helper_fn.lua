function MERGE_CONFIGS(dir_path)
  local result = {}
  for name, type in vim.fs.dir(dir_path) do
    if type == "file" and name:match("%.lua$") then
      local file_table = loadfile(dir_path .. "/" .. name)()
      table.insert(result, file_table)
    end
  end
  return result
end

-- local plugins = MERGE_CONFIGS(vim.fn.stdpath("config") .. "/lua/plugins")
