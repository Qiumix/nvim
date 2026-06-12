---@type wk.Spec
return {
  -- ═══════════════════════════════════════════════════════════
  --  ORIGINAL GROUPS & SPECIFICATIONS
  -- ═══════════════════════════════════════════════════════════
  { "<leader><tab>", group = "tabs", icon = "󰓩 " },
  { "<leader>t", group = "toggle", icon = " " },
  { "<leader>l", group = "language", icon = " " },
  { "<leader>D", group = "Diffview", icon = { icon = "", color = "orange" } },
  { "<leader>g", group = "git" },
  { "<leader>q", group = "quit/session" },
  { "<leader>s", group = "search" },
  { "[", group = "prev" },
  { "]", group = "next" },
  { "g", group = "goto" },
  { "s", group = "surround" },
  { "z", group = "fold" },
  {
    "<leader>b",
    group = "buffer",
    expand = function()
      return require("which-key.extras").expand.buf()
    end,
  },
  {
    "<leader>w",
    group = "windows",
    proxy = "<c-w>",
    expand = function()
      return require("which-key.extras").expand.win()
    end,
  },
  { "gx", desc = "Open with system app", icon = "󰏌 " },
  {
    "<leader>?",
    function()
      require("which-key").show({ global = true })
    end,
    desc = "Buffer Keymaps (which-key)",
  },

  -- ═══════════════════════════════════════════════════════════
  --  MERGED KEYMAPS SPECIFICATION
  -- ═══════════════════════════════════════════════════════════

  -- Global Root Movements & Keys (Normal Mode)
  { "<C-I>", "<C-I>", desc = "Jump forward", mode = "n" },
  { "n", "nzzzv", desc = "Next search match", mode = "n" },
  { "N", "Nzzzv", desc = "Prev search match", mode = "n" },
  { "<Tab>", ":bnext<CR>", desc = "Next buffer", mode = "n", silent = true },
  { "<S-Tab>", ":bprevious<CR>", desc = "Previous buffer", mode = "n", silent = true },
  { "<S-l>", "<cmd>bnext<cr>", desc = "Next Buffer", mode = "n" },
  { "<S-h>", "<cmd>bprevious<cr>", desc = "Prev Buffer", mode = "n" },
  { "<A-d>", "<cmd>bd<cr>", desc = "Delete Current Buffer", mode = "n" },

  -- Multi-mode Root Mappings
  { "<esc>", "<cmd>nohlsearch<cr><esc>", desc = "Escape and Clear hlsearch", mode = { "i", "n" } },
  { "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', desc = "Toggle Fterm", mode = "n" },
  { "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', desc = "Toggle Fterm", mode = "t" },

  -- Smart j/k Movements
  { "j", "v:count == 0 ? 'gj' : 'j'", desc = "Down", mode = { "n", "x" }, expr = true, silent = true },
  { "k", "v:count == 0 ? 'gk' : 'k'", desc = "Up", mode = { "n", "x" }, expr = true, silent = true },
  { "<Down>", "v:count == 0 ? 'gj' : 'j'", desc = "Down", mode = { "n", "x" }, expr = true, silent = true },
  { "<Up>", "v:count == 0 ? 'gk' : 'k'", desc = "Up", mode = { "n", "x" }, expr = true, silent = true },

  -- Line Swapping (Alt+j/k)
  { "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", desc = "Move Down", mode = "n" },
  { "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", desc = "Move Up", mode = "n" },
  { "<A-j>", "<esc><cmd>m .+1<cr>==gi", desc = "Move Down", mode = "i" },
  { "<A-k>", "<esc><cmd>m .-2<cr>==gi", desc = "Move Up", mode = "i" },
  { "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", desc = "Move Down", mode = "v" },
  { "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", desc = "Move Up", mode = "v" },

  -- Visual Mode Base Mappings
  { "<", "<gv", desc = "Indent left and keep selection", mode = "v" },
  { ">", ">gv", desc = "Indent right and keep selection", mode = "v" },
  {
    "p",
    function()
      if vim.fn.mode() == "V" then
        return "P"
      else
        return '"_dP'
      end
    end,
    desc = "Smart paste without overwriting register",
    mode = "v",
    expr = true,
    silent = true,
  },

  -- Insert Mode Base Mappings
  { ",", ",<c-g>u", desc = "Undo break point (,)", mode = "i" },
  { ".", ".<c-g>u", desc = "Undo break point (.)", mode = "i" },
  { ";", ";<c-g>u", desc = "Undo break point (;)", mode = "i" },

  -- ── Group: [ (Prev) ────────────────────────────────────────
  { "[q", vim.cmd.cprev, desc = "Previous Quickfix", mode = "n" },

  -- ── Group: ] (Next) ────────────────────────────────────────
  { "]q", vim.cmd.cnext, desc = "Next Quickfix", mode = "n" },

  -- ── Group: g (Goto) ────────────────────────────────────────
  { "gl", "$", desc = "Go to end of line", mode = { "n", "v", "o" } },
  { "gh", "^", desc = "Go to start of line", mode = { "n", "v", "o" } },
  { "ge", "G", desc = "Go to end of file", mode = { "n", "x", "o" } },
  { "go", "%", desc = "Jump to matching bracket", mode = { "n", "x", "o" } },
  { "gd", vim.lsp.buf.definition, desc = "LSP Goto Definition", mode = "n" },

  -- ── Group: Alt Navigation ──────────────────────────────────
  { "<A-h>", "^", desc = "Go to start of line", mode = { "n", "v", "o" } },
  { "<A-l>", "$", desc = "Go to end of line", mode = { "n", "v", "o" } },

  -- ── Group: z (Fold) ────────────────────────────────────────
  { "zv", "zMzvzz", desc = "Close all folds except the current one", mode = "n" },

  -- ── Group: <leader><tab> (Tabs) ────────────────────────────
  { "<leader><tab>l", "<cmd>tablast<cr>", desc = "Last Tab", mode = "n" },
  { "<leader><tab>o", "<cmd>tabonly<cr>", desc = "Close Other Tabs", mode = "n" },
  { "<leader><tab>f", "<cmd>tabfirst<cr>", desc = "First Tab", mode = "n" },
  { "<leader><tab><tab>", "<cmd>tabnew<cr>", desc = "New Tab", mode = "n" },
  { "<leader><tab>]", "<cmd>tabnext<cr>", desc = "Next Tab", mode = "n" },
  { "<leader><tab>d", "<cmd>tabclose<cr>", desc = "Close Tab", mode = "n" },
  { "<leader><tab>[", "<cmd>tabprevious<cr>", desc = "Previous Tab", mode = "n" },

  -- ── Group: <leader>b (Buffer extras) ───────────────────────
  { "<leader>bb", "<cmd>e #<cr>", desc = "Switch to Other Buffer", mode = "n" },
  { "<leader>bd", "<cmd>bd<cr>", desc = "Delete Current Buffer", mode = "n" },

  -- ── Group: <leader>t (Toggle) ──────────────────────────────
  { "<leader>tw", "<cmd>set wrap!<CR>", desc = "Toggle Wrap", mode = "n", silent = true },
  {
    "<leader>tf",
    function()
      if vim.g.disable_autoformat then
        vim.g.disable_autoformat = false
        vim.notify("Autoformat enabled", vim.log.levels.INFO)
      else
        vim.g.disable_autoformat = true
        vim.notify("Autoformat disabled", vim.log.levels.INFO)
      end
    end,
    desc = "Toggle autoformat(global)",
    mode = "n",
  },
  { "<leader>ti", vim.show_pos, desc = "Inspect Pos", mode = "n" },
  { "<leader>tI", "<cmd>InspectTree<cr>", desc = "Inspect Tree", mode = "n" },

  -- ── Group: <leader>l (Language) ────────────────────────────
  {
    "<leader>lf",
    function()
      require("conform").format({ async = true }, function(err, did_edit)
        if not err and did_edit then
          vim.notify("Code formatted", vim.log.levels.INFO, { title = "Conform" })
        end
      end)
    end,
    desc = "Format buffer",
    mode = { "n", "v" },
  },
  { "<leader>ld", vim.diagnostic.setqflist, desc = "Open Diagnostic Buffer", mode = "n" },

  -- ── Group: <leader>q (Quit) ────────────────────────────────
  { "<leader>qq", "<cmd>qa<cr>", desc = "Quit All", mode = "n" },

  -- ── Group: <leader>o (System Hooks) ────────────────────────
  { "<leader>oo", "<cmd>source<CR>", desc = "Source file", mode = "n" },
  { "<leader>or", "<cmd>restart<CR>", desc = "Restart", mode = "n" },

  -- ── Group: <leader>k (Translate) ───────────────────────────
  { "<leader>k", ":TranslateNormal<CR>", desc = "Translate word", mode = "n" },
  { "<leader>k", ":TranslateVisual<CR>", desc = "Translate select", mode = "v" },

  -- ── Group: <leader>e (Explorer) ────────────────────────────
  { "<leader>e", "<cmd>Yazi<CR>", desc = "Yazi", mode = "n" },

  -- ── Group: <leader>s (Search / Television) ─────────────────
  { "<leader>ss", "<cmd>Tv<cr>", desc = "Television", mode = "n" },
  { "<leader>sf", "<cmd>Tv files<cr>", desc = "🔍 Search and open files", mode = "n" },
  { "<leader>sc", "<cmd>Tv text<cr>", desc = "📝 Search text content", mode = "n" },
  { "<leader>se", "<cmd>Tv env<cr>", desc = "🌐 Browse environment variables", mode = "n" },
  { "<leader>sd", "<cmd>Tv dirs<cr>", desc = "📂 Browse directories", mode = "n" },
  { "<leader>sgb", "<cmd>Tv git-branch<cr>", desc = "🌿 Switch git branches", mode = "n" },
  { "<leader>sgd", "<cmd>Tv git-diff<cr>", desc = "🆚 Browse git diffs", mode = "n" },
  { "<leader>sgl", "<cmd>Tv git-log<cr>", desc = "📜 Browse git commit history", mode = "n" },

  -- ── Group: <leader>w / <C-w> (Windows extras) ──────────────
  { "<C-h>", "<C-w>h", desc = "Go to Left Window", mode = "n", remap = true },
  { "<C-j>", "<C-w>j", desc = "Go to Lower Window", mode = "n", remap = true },
  { "<C-k>", "<C-w>k", desc = "Go to Upper Window", mode = "n", remap = true },
  { "<C-l>", "<C-w>l", desc = "Go to Right Window", mode = "n", remap = true },
  { "<C-S-Up>", "<cmd>resize +5<CR>", desc = "Resize window up", mode = "n", silent = true },
  { "<C-S-Down>", "<cmd>resize -5<CR>", desc = "Resize window down", mode = "n", silent = true },
  { "<C-S-Left>", "<cmd>vertical resize -5<CR>", desc = "Resize window left", mode = "n", silent = true },
  { "<C-S-Right>", "<cmd>vertical resize +5<CR>", desc = "Resize window right", mode = "n", silent = true },
  { "<leader>ww", "<C-W>p", desc = "Other Window", mode = "n", remap = true },
  { "<leader>wd", "<C-W>c", desc = "Delete Window", mode = "n", remap = true },
  { "<leader>w-", "<C-W>s", desc = "Split Window Below", mode = "n", remap = true },
  { "<leader>w|", "<C-W>v", desc = "Split Window Right", mode = "n", remap = true },
  { "<leader>|", "<C-W>v", desc = "Split Window Right", mode = "n", remap = true },
}
