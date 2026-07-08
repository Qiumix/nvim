---@class LznPackSpecItem
---@field data?     any
---@field name?     string
---@field src       string
---@field version?  string|vim.VersionRange
---@field enabled?  boolean|fun():boolean
---@field priority? number
---@field load?     fun(name:string)
---@field beforeAll? fun(self:LznPackSpecItem)
---@field before?    fun(self:LznPackSpecItem)
---@field after?     fun(self:LznPackSpecItem)
---@field event?       string|lz.n.EventSpec[]
---@field cmd?         string[]|string
---@field ft?          string[]|string
---@field keys?        string|string[]|lz.n.KeysSpec[]
---@field colorscheme? string[]|string
---@field lazy?        boolean

---@alias LznPackSpec LznPackSpecItem | LznPackSpecItem[]

---Return full url of a github repo
---@param repo_addr string
---@return string
local function github_prefix(repo_addr)
  return "https://github.com/" .. repo_addr
end

---Scan a directory for plugin spec files and collect only vim.pack specs.
---lz.n specs are handled by lz.n's own directory-scanning import mechanism.
---
---@param mod_prefix string (e.g., "plugins.editor")
---@return table[] pack_specs
function CollectPackSpecs(mod_prefix)
  local dir_path = vim.fn.stdpath("config") .. "/lua/" .. mod_prefix:gsub("%.", "/")
  local pack_specs = {}

  local function collect_spec(s)
    if s.src then
      local src = s.src
      if type(src) == "string" and not src:match("^https?://") then
        src = github_prefix(src)
      end
      local p = {
        src = src,
        name = s.name,
        version = s.version,
      }
      table.insert(pack_specs, p)
    end
  end

  for name, typ in vim.fs.dir(dir_path) do
    if typ == "file" and name:match("%.lua$") then
      local ok, loader = pcall(loadfile, dir_path .. "/" .. name)
      if ok and loader then
        local ok2, spec = pcall(loader)
        if ok2 and type(spec) == "table" then
          if type(spec[1]) == "table" then
            for _, s in ipairs(spec) do
              collect_spec(s)
            end
          else
            collect_spec(spec)
          end
        end
      end
    end
  end

  return pack_specs
end

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

---Scans a directory for plugin spec files, auto-derives [1] for lz.n from name or src,
---and registers them with lz.n.
---@param mod_prefix string (e.g., "plugins.editor")
function LznLoadSpecs(mod_prefix)
  local lzn = require("lz.n")
  local dir_path = vim.fn.stdpath("config") .. "/lua/" .. mod_prefix:gsub("%.", "/")
  local all_specs = {}

  local function process_spec(spec)
    if type(spec) ~= "table" then return end
    if not spec[1] and spec.src then
      spec[1] = spec.name or spec.src:match("([^/]+)$")
    end
    table.insert(all_specs, spec)
  end

  for name, typ in vim.fs.dir(dir_path) do
    if typ == "file" and name:match("%.lua$") then
      local ok, loader = pcall(loadfile, dir_path .. "/" .. name)
      if ok and loader then
        local ok2, spec_or_list = pcall(loader)
        if ok2 and type(spec_or_list) == "table" then
          if type(spec_or_list[1]) == "table" then
            for _, s in ipairs(spec_or_list) do
              process_spec(s)
            end
          else
            process_spec(spec_or_list)
          end
        end
      end
    end
  end

  lzn.load(all_specs)
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
