---@module "which-key"
---@type wk.Spec
return {
  -- <leader>g Prefix (Git - gitsigns)
  { "<leader>gb", desc = "Blame line", mode = "n", icon = { icon = "󰦖 ", color = "orange" } },
  { "<leader>gd", desc = "Git diff", mode = "n", icon = { icon = " ", color = "purple" } },
  { "<leader>gD", desc = "Git diff ~", mode = "n", icon = { icon = " ", color = "purple" } },
  {
    "<leader>gg",
    function()
      Snacks.lazygit.open()
    end,
    desc = "Lazygit",
    mode = "n",
    icon = { icon = " ", color = "purple" },
  },
  { "<leader>gi", desc = "Preview hunk inline", mode = "n", icon = { icon = "󰶯 ", color = "cyan" } },
  { "<leader>gL", desc = "Git quickfix list all", mode = "n", icon = { icon = "󰁨 ", color = "azure" } },
  { "<leader>gl", desc = "Git quickfix list", mode = "n", icon = { icon = "󰁨 ", color = "azure" } },
  { "<leader>gp", desc = "Preview hunk", mode = "n", icon = { icon = "󰶯 ", color = "cyan" } },
  { "<leader>gR", desc = "Buffer reset", mode = "n", icon = { icon = "󰁯 ", color = "red" } },
  { "<leader>gr", desc = "Hunk reset", mode = { "n", "v" }, icon = { icon = "󰁯 ", color = "red" } },
  { "<leader>gS", desc = "Toggle buffer stage", mode = "n", icon = { icon = "󰊢 ", color = "green" } },
  { "<leader>gs", desc = "Toggle hunk stage", mode = { "n", "v" }, icon = { icon = "󰊢 ", color = "green" } },
  { "ih", desc = "Git hunk", mode = { "o", "x" }, icon = { icon = "󰊢 ", color = "purple" } },

  -- <leader>gh Prefix (GitHub)
  { "<leader>gh", group = "GitHub", icon = { icon = " ", color = "purple" } },
  {
    "<leader>ghi",
    function()
      Snacks.picker.gh_issue()
    end,
    desc = "Issues",
    mode = "n",
    icon = { icon = " ", color = "green" },
  },
  {
    "<leader>ghI",
    function()
      Snacks.picker.gh_issue({ assignee = "@me" })
    end,
    desc = "My Issues",
    mode = "n",
    icon = { icon = " ", color = "green" },
  },
  {
    "<leader>ghp",
    function()
      Snacks.picker.gh_pr()
    end,
    desc = "Pull Requests",
    mode = "n",
    icon = { icon = " ", color = "purple" },
  },
  {
    "<leader>ghP",
    function()
      Snacks.picker.gh_pr({ author = "@me" })
    end,
    desc = "My PRs",
    mode = "n",
    icon = { icon = " ", color = "purple" },
  },
  {
    "<leader>ghd",
    function()
      vim.ui.input({ prompt = "PR number: " }, function(pr)
        if pr then
          Snacks.picker.gh_diff({ pr = tonumber(pr) })
        end
      end)
    end,
    desc = "PR Diff",
    mode = "n",
    icon = { icon = " ", color = "cyan" },
  },
  {
    "<leader>gha",
    function()
      Snacks.picker.gh_actions()
    end,
    desc = "Current PR Actions",
    mode = "n",
    icon = { icon = "󰐊 ", color = "yellow" },
  },
  {
    "<leader>ghb",
    function()
      Snacks.gitbrowse.open({ what = "line" })
    end,
    desc = "Browse file/line",
    mode = "n",
    icon = { icon = "󰖟 ", color = "azure" },
  },
  {
    "<leader>ghB",
    function()
      Snacks.gitbrowse.open({ what = "repo" })
    end,
    desc = "Browse repo",
    mode = "n",
    icon = { icon = "󰖟 ", color = "blue" },
  },
}
