local sign = {
  add = { text = "▎" },
  change = { text = "▎" },
  delete = { text = "" },
  topdelete = { text = "" },
  changedelete = { text = "▎" },
  untracked = { text = "▎" },
}

local config = {
  current_line_blame = true,
  signs = sign,
  signs_staged = sign,
  on_attach = function(bufnr)
    local gitsigns = require("gitsigns")

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map("n", "]g", function()
      if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
      else
        gitsigns.nav_hunk("next")
      end
    end, { desc = "Git diff next" })

    map("n", "[g", function()
      if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
      else
        gitsigns.nav_hunk("prev")
      end
    end, { desc = "Git diff prev" })

    -- Actions
    map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Toggle hunk stage" })
    map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Hunk reset" })

    map("v", "<leader>gs", function()
      gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end)

    map("v", "<leader>gr", function()
      gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "Git reset" })

    map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Toggle buffer stage" })
    map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Buffer reset" })

    map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "preview_hunk" })
    map("n", "<leader>gi", gitsigns.preview_hunk_inline, { desc = "preview_hunk_inline" })

    map("n", "<leader>gb", function()
      gitsigns.blame_line({ full = true })
    end, { desc = "blame_line" })

    map("n", "<leader>gd", gitsigns.diffthis, { desc = "Git diff" })

    map("n", "<leader>gD", function()
      gitsigns.diffthis("~")
    end, { desc = "Git diff ~" })

    map("n", "<leader>gL", function()
      gitsigns.setqflist("all")
    end, { desc = "Git quickfix list all" })
    map("n", "<leader>gl", gitsigns.setqflist, { desc = "Git quickfix list" })

    -- Toggles
    map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle git line blame" })
    map("n", "<leader>tW", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })

    -- Text object
    map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Git hunk" })
  end,
}

---@type lz.n.PluginSpec
return {
  "gitsigns.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("gitsigns").setup(config)
  end,
}
