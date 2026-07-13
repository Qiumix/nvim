---@module "yazi"
---@type YaziConfig | {}
local config = {
  floating_window_scaling_factor = 0.8,
  integrations = {
    grep_in_directory = function(directory)
      require("yazi").close()
      vim.schedule(function()
        vim.cmd("cd " .. vim.fn.fnameescape(directory))
        vim.cmd("Tv text")
      end)
    end,
  },
}

return config
