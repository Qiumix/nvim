---@type wk.Spec
return {
  -- ═══════════════════════════════════════════════════════════
  --  PRE-DEFINED GROUPS & INITIAL SPECIFICATIONS
  -- ═══════════════════════════════════════════════════════════
  { "<leader><tab>", group = "tabs", icon = "󰓩 " },
  { "<leader>t", group = "toggle", icon = " " },
  { "<leader>l", group = "language", icon = " " },
  { "<leader>D", group = "Diffview", icon = { icon = "", color = "orange" } },
  { "<leader>g", group = "git", icon = " " },
  { "<leader>q", group = "quit/session", icon = "󰈆 " },
  { "<leader>s", group = "search", icon = " " },
  { "[", group = "prev", icon = "󰮳 " },
  { "]", group = "next", icon = "󰮴 " },
  { "g", group = "goto/buffer", icon = "󰕒 " },
  { "s", group = "surround", icon = "e " },
  { "z", group = "fold", icon = "󰘖 " },
  {
    "<leader>b",
    group = "buffer",
    icon = "󰓩 ",
    expand = function()
      return require("which-key.extras").expand.buf()
    end,
  },
  {
    "<leader>w",
    group = "windows",
    proxy = "<c-w>",
    icon = "󰖯 ",
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
    icon = "󰞋 ",
  },

  -- ═══════════════════════════════════════════════════════════
  --  TEXT OBJECTS DESCRIPTIONS (mini.ai & Tree-sitter Textobjects)
  --  Triggered after pressing operators (v/d/c/y) followed by a/i[cite: 3]
  -- ═══════════════════════════════════════════════════════════
  {
    mode = { "x", "o" }, -- Target both Visual and Operator-pending modes[cite: 3]
    { "a", desc = "Argument / Parameter", icon = "󰅪 " },
    { "f", desc = "Function / Method definition", icon = "󰡱 " },
    { "F", desc = "Class / Struct definition", icon = "󰌗 " },
    { "o", desc = "Condition / Loop block", icon = "󰞕 " },

    -- Complementing mini.ai's builtin specs from image_4c5e77.jpg
    { "b", desc = "Balanced ( ) [ ] { }", icon = "󰅩 " },
    { "B", desc = "Balanced { } block", icon = "󰅪 " },
    { "i", desc = "Object scope with border", icon = "󰦪 " },
    { "n", desc = "Around next textobject", icon = "󰄾 " },
    { "l", desc = "Around last textobject", icon = "󰄼 " },
    { "p", desc = "Paragraph", icon = "󰦨 " },
    { "s", desc = "Sentence", icon = "󰦪 " },
    { "t", desc = "XML / HTML tag block", icon = "󰜬 " },
    { "w", desc = "Word with white spaces", icon = "󰗊 " },
    { "W", desc = "WORD with white spaces", icon = "󰗊 " },
    { '"', desc = "Double quoted string", icon = "󱇬 " },
    { "'", desc = "Single quoted string", icon = "󱇬 " },
    { "`", desc = "Backtick quoted string", icon = "󱇬 " },
  },

  -- ═══════════════════════════════════════════════════════════
  --  MERGED GLOBAL & ROOT KEYMAPS
  -- ═══════════════════════════════════════════════════════════
  -- Root Movements (Normal Mode)
  { "<C-I>", "<C-I>", desc = "Jump forward in jumplist", mode = "n", icon = "󰕒 " },
  { "n", "nzzzv", desc = "Next search match", mode = "n", icon = "󰮴 " },
  { "N", "Nzzzv", desc = "Prev search match", mode = "n", icon = "󰮳 " },

  -- Buffer Navigation & Management (Cleaned up redundant S-l/S-h bindings)
  { "<Tab>", "<cmd>bnext<cr>", desc = "Next Buffer", mode = "n", icon = "󰄾 " },
  { "<S-Tab>", "<cmd>bprevious<cr>", desc = "Prev Buffer", mode = "n", icon = "󰄼 " },
  { "<A-d>", "<cmd>bd<cr>", desc = "Delete Current Buffer", mode = "n", icon = "󰭌 " },

  -- Multi-mode Window & Terminal UI
  { "<esc>", "<cmd>nohlsearch<cr><esc>", desc = "Escape and Clear hlsearch", mode = { "i", "n" }, icon = "󱊷 " },
  { "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>', desc = "Toggle Fterm", mode = "n", icon = "󰞀 " },
  { "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', desc = "Toggle Fterm", mode = "t", icon = "󰞀 " },

  -- Smart Visual j/k Movements (Standardized visual mode to 'x')
  { "j", "v:count == 0 ? 'gj' : 'j'", desc = "Down", mode = { "n", "x" }, expr = true, silent = true, icon = "󰜮 " },
  { "k", "v:count == 0 ? 'gk' : 'k'", desc = "Up", mode = { "n", "x" }, expr = true, silent = true, icon = "󰜷 " },
  {
    "<Down>",
    "v:count == 0 ? 'gj' : 'j'",
    desc = "Down",
    mode = { "n", "x" },
    expr = true,
    silent = true,
    icon = "󰜮 ",
  },
  { "<Up>", "v:count == 0 ? 'gk' : 'k'", desc = "Up", mode = { "n", "x" }, expr = true, silent = true, icon = "󰜷 " },

  -- VSCode Line Swapping (Alt+j/k)
  { "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", desc = "Move Line Down", mode = "n", icon = "󰜮 " },
  { "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", desc = "Move Line Up", mode = "n", icon = "󰜷 " },
  { "<A-j>", "<esc><cmd>m .+1<cr>==gi", desc = "Move Line Down", mode = "i", icon = "󰜮 " },
  { "<A-k>", "<esc><cmd>m .-2<cr>==gi", desc = "Move Line Up", mode = "i", icon = "󰜷 " },
  {
    "<A-j>",
    ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv",
    desc = "Move Selection Down",
    mode = "x",
    icon = "󰜮 ",
  },
  {
    "<A-k>",
    ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv",
    desc = "Move Selection Up",
    mode = "x",
    icon = "󰜷 ",
  },

  -- Visual Editing Core
  { "<", "<gv", desc = "Indent left and keep selection", mode = "x", icon = "󰉶 " },
  { ">", ">gv", desc = "Indent right and keep selection", mode = "x", icon = "󰉵 " },
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
    mode = "x",
    expr = true,
    silent = true,
    icon = "󰅌 ",
  },

  -- Insert Mode Break-points
  { ",", ",<c-g>u", desc = "Undo break point (,)", mode = "i", icon = "󰞋 " },
  { ".", ".<c-g>u", desc = "Undo break point (.)", mode = "i", icon = "󰞋 " },
  { ";", ";<c-g>u", desc = "Undo break point (;)", mode = "i", icon = "󰞋 " },

  -- ═══════════════════════════════════════════════════════════
  --  GROUPED MAPS (SUB-PATHS)
  -- ═══════════════════════════════════════════════════════════
  -- [ Prefix (Previous)
  { "[q", vim.cmd.cprev, desc = "Previous Quickfix", mode = "n", icon = "󰮳 " },

  -- ] Prefix (Next)
  { "]q", vim.cmd.cnext, desc = "Next Quickfix", mode = "n", icon = "󰮴 " },

  -- g Prefix (Goto & Helix Buffer Style)
  { "gl", "$", desc = "Go to end of line", mode = { "n", "x", "o" }, icon = "󰦡 " },
  { "gh", "^", desc = "Go to start of line", mode = { "n", "x", "o" }, icon = "󰦣 " },
  { "ge", "G", desc = "Go to end of file", mode = { "n", "x", "o" }, icon = "󰋨 " },
  { "go", "%", desc = "Jump to matching bracket", mode = { "n", "x", "o" }, icon = "󰅪 " },
  { "gd", vim.lsp.buf.definition, desc = "LSP Goto Definition", mode = "n", icon = "󰔪 " },
  { "gn", "<cmd>bnext<CR>", desc = "Next buffer", mode = "n", icon = "󰄾 " },
  { "gp", "<cmd>bprevious<CR>", desc = "Previous buffer", mode = "n", icon = "󰄼 " },

  -- Alt-based Navigation
  { "<A-h>", "^", desc = "Go to start of line", mode = { "n", "x", "o" }, icon = "󰦣 " },
  { "<A-l>", "$", desc = "Go to end of line", mode = { "n", "x", "o" }, icon = "󰦡 " },

  -- z Prefix (Fold controls)
  { "zv", "zMzvzz", desc = "Close all folds except the current one", mode = "n", icon = "󰘖 " },

  -- <leader><tab> Prefix (Tabs)
  { "<leader><tab><tab>", "<cmd>tabnew<cr>", desc = "New Tab", mode = "n", icon = "󰓩 " },
  { "<leader><tab>]", "<cmd>tabnext<cr>", desc = "Next Tab", mode = "n", icon = "󰄾 " },
  { "<leader><tab>[", "<cmd>tabprevious<cr>", desc = "Previous Tab", mode = "n", icon = "󰄼 " },
  { "<leader><tab>f", "<cmd>tabfirst<cr>", desc = "First Tab", mode = "n", icon = "󰮳 " },
  { "<leader><tab>l", "<cmd>tablast<cr>", desc = "Last Tab", mode = "n", icon = "󰮴 " },
  { "<leader><tab>o", "<cmd>tabonly<cr>", desc = "Close Other Tabs", mode = "n", icon = "󰭌 " },
  { "<leader><tab>d", "<cmd>tabclose<cr>", desc = "Close Tab", mode = "n", icon = "󰭌 " },

  -- <leader>b Prefix (Buffers extras)
  { "<leader>bb", "<cmd>e #<cr>", desc = "Switch to Other Buffer", mode = "n", icon = "󰓦 " },
  { "<leader>bd", "<cmd>bd<cr>", desc = "Delete Current Buffer", mode = "n", icon = "󰭌 " },

  -- <leader>t Prefix (Toggles & Diagnostics)
  { "<leader>tw", "<cmd>set wrap!<CR>", desc = "Toggle Wrap", mode = "n", silent = true, icon = "󰖶 " },
  { "<leader>ti", vim.show_pos, desc = "Inspect Pos", mode = "n", icon = "󰘚 " },
  { "<leader>tI", "<cmd>InspectTree<cr>", desc = "Inspect Tree", mode = "n", icon = "󰙅 " },
  {
    "<leader>td",
    "<cmd>TinyInlineDiag toggle<cr>",
    desc = "Toggle Inline Diagnostics",
    mode = "n",
    silent = true,
    icon = "󰙏 ",
  },
  {
    "<leader>tc",
    "<cmd>TinyInlineDiag toggle_cursor_only<cr>",
    desc = "Toggle Cursor-Only Diags",
    mode = "n",
    silent = true,
    icon = "󰹹 ",
  },

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
    icon = "󰉼 ",
  },

  -- <leader>l Prefix (LSP & Language tools)
  { "<leader>ld", vim.diagnostic.setqflist, desc = "Open Diagnostic Buffer", mode = "n", icon = "󰮭 " },
  {
    "<leader>lf",
    function()
      local has_conform, conform = pcall(require, "conform")
      if has_conform then
        conform.format({ async = true }, function(err, did_edit)
          if not err and did_edit then
            vim.notify("Code formatted", vim.log.levels.INFO, { title = "Conform" })
          end
        end)
      else
        vim.lsp.buf.format({ async = true })
      end
    end,
    desc = "Format buffer",
    mode = { "n", "x" },
    icon = "󰛦 ",
  },

  -- <leader>q Prefix (Session Control)
  { "<leader>q", "<cmd>qa<cr>", desc = "Quit All", mode = "n", icon = "󰈆 " },

  -- <leader>o Prefix (System Control Hooks)
  { "<leader>oo", "<cmd>source<CR>", desc = "Source file", mode = "n", icon = "󰑓 " },
  { "<leader>or", "<cmd>restart<CR>", desc = "Restart", mode = "n", icon = "󰜉 " },

  -- <leader>k Prefix (Translation)
  {
    "<leader>k",
    ":TranslateNormal<CR>",
    desc = "Translate word",
    mode = "n",
    icon = { icon = "󰗊 ", color = "orange" },
  },
  { "<leader>k", ":TranslateVisual<CR>", desc = "Translate select", mode = "x", icon = "󰗊 " },

  -- <leader>e Prefix (Explorer)
  { "<leader>e", "<cmd>Yazi<CR>", desc = "Yazi", mode = "n", icon = "󰇥 " },
  {
    "<leader>E",
    function()
      require("oil").toggle_float()
    end,
    desc = "Oil",
    mode = "n",
    icon = "󰏇 ",
  },

  -- <leader>s Prefix (Television Search Engines)
  { "<leader>ss", "<cmd>Tv<cr>", desc = "Television Panel", mode = "n", icon = "󰭟 " },
  { "<leader>sf", "<cmd>Tv files<cr>", desc = "Search and open files", mode = "n", icon = "󰱼 " },
  { "<leader>sc", "<cmd>Tv text<cr>", desc = "Search text content", mode = "n", icon = "󰦨 " },
  { "<leader>se", "<cmd>Tv env<cr>", desc = "Browse environment variables", mode = "n", icon = "󰖟 " },
  { "<leader>sd", "<cmd>Tv dirs<cr>", desc = "Browse directories", mode = "n", icon = "󰉋 " },
  { "<leader>sgb", "<cmd>Tv git-branch<cr>", desc = "Switch git branches", mode = "n", icon = " " },
  { "<leader>sgd", "<cmd>Tv git-diff<cr>", desc = "Browse git diffs", mode = "n", icon = " " },
  { "<leader>sgl", "<cmd>Tv git-log<cr>", desc = "Browse git commit history", mode = "n", icon = " " },

  -- <leader>w Prefix & Ctrl-w Helpers (Windows control - Horizontal Split Only)
  { "<C-h>", "<C-w>h", desc = "Go to Left Window", mode = "n", remap = true, icon = "󰄼 " },
  { "<C-j>", "<C-w>j", desc = "Go to Lower Window", mode = "n", remap = true, icon = "󰜮 " },
  { "<C-k>", "<C-w>k", desc = "Go to Upper Window", mode = "n", remap = true, icon = "󰜷 " },
  { "<C-l>", "<C-w>l", desc = "Go to Right Window", mode = "n", remap = true, icon = "󰄾 " },
  { "<C-S-Up>", "<cmd>resize +5<CR>", desc = "Resize window up", mode = "n", silent = true, icon = "󰜷 " },
  { "<C-S-Down>", "<cmd>resize -5<CR>", desc = "Resize window down", mode = "n", silent = true, icon = "󰜮 " },
  {
    "<C-S-Left>",
    "<cmd>vertical resize -5<CR>",
    desc = "Resize window left",
    mode = "n",
    silent = true,
    icon = "󰄼 ",
  },
  {
    "<C-S-Right>",
    "<cmd>vertical resize +5<CR>",
    desc = "Resize window right",
    mode = "n",
    silent = true,
    icon = "󰄾 ",
  },
  { "<leader>ww", "<C-W>p", desc = "Other Window", mode = "n", remap = true, icon = "󰖯 " },
  { "<leader>wd", "<C-W>c", desc = "Delete Window", mode = "n", remap = true, icon = "󰭌 " },
  { "<leader>w-", "<C-W>s", desc = "Split Window Below", mode = "n", remap = true, icon = "󰖰 " },
  { "<leader>w|", "<C-W>v", desc = "Split Window Vertically", mode = "n", remap = true, icon = "| " },
}
