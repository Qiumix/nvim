---@type wk.Spec
return {
  -- ═══════════════════════════════════════════════════════════
  --  PRE-DEFINED GROUPS & INITIAL SPECIFICATIONS
  -- ═══════════════════════════════════════════════════════════
  { "<leader><tab>", group = "tabs", icon = { icon = "󰓩 ", color = "blue" } },
  { "<leader>t", group = "toggle", icon = { icon = " ", color = "cyan" } },
  { "<leader>l", group = "language", icon = { icon = " ", color = "green" } },
  { "<leader>D", group = "Diffview", icon = { icon = "", color = "orange" } },
  { "<leader>g", group = "git", icon = { icon = " ", color = "purple" } },
  { "<leader>q", group = "quit/session", icon = { icon = "󰈆 ", color = "red" } },
  { "<leader>s", group = "search", icon = { icon = " ", color = "yellow" } },
  { "[", group = "prev", icon = { icon = "󰮳 ", color = "azure" } },
  { "]", group = "next", icon = { icon = "󰮴 ", color = "azure" } },
  { "g", group = "goto/buffer", icon = { icon = "󰕒 ", color = "blue" } },
  { "s", group = "surround", icon = { icon = "e ", color = "grey" } },
  { "z", group = "fold", icon = { icon = "󰘖 ", color = "grey" } },
  {
    "<leader>b",
    group = "buffer",
    icon = { icon = "󰓩 ", color = "blue" },
    expand = function()
      return require("which-key.extras").expand.buf()
    end,
  },
  {
    "<leader>w",
    group = "windows",
    proxy = "<c-w>",
    icon = { icon = "󰖯 ", color = "cyan" },
    expand = function()
      return require("which-key.extras").expand.win()
    end,
  },
  { "gx", desc = "Open with system app", icon = { icon = "󰏌 ", color = "green" } },
  {
    "<leader>?",
    function()
      require("which-key").show({ global = true })
    end,
    desc = "Buffer Keymaps (which-key)",
    icon = { icon = "󰞋 ", color = "yellow" },
  },

  -- ═══════════════════════════════════════════════════════════
  --  TEXT OBJECTS DESCRIPTIONS (mini.ai & Tree-sitter Textobjects)
  --  Triggered after pressing operators (v/d/c/y) followed by a/i
  -- ═══════════════════════════════════════════════════════════
  {
    mode = { "x", "o" }, -- Target both Visual and Operator-pending modes
    { "a", desc = "Argument / Parameter", icon = { icon = "󰅪 ", color = "cyan" } },
    { "f", desc = "Function / Method definition", icon = { icon = "󰡱 ", color = "blue" } },
    { "F", desc = "Class / Struct definition", icon = { icon = "󰌗 ", color = "orange" } },
    { "o", desc = "Condition / Loop block", icon = { icon = "󰞕 ", color = "purple" } },

    -- Complementing mini.ai's builtin specs
    { "b", desc = "Balanced ( ) [ ] { }", icon = { icon = "󰅩 ", color = "grey" } },
    { "B", desc = "Balanced { } block", icon = { icon = "󰅪 ", color = "grey" } },
    { "i", desc = "Object scope with border", icon = { icon = "󰦪 ", color = "grey" } },
    { "n", desc = "Around next textobject", icon = { icon = "󰄾 ", color = "azure" } },
    { "l", desc = "Around last textobject", icon = { icon = "󰄼 ", color = "azure" } },
    { "p", desc = "Paragraph", icon = { icon = "󰦨 ", color = "yellow" } },
    { "s", desc = "Sentence", icon = { icon = "󰦪 ", color = "yellow" } },
    { "t", desc = "XML / HTML tag block", icon = { icon = "󰜬 ", color = "red" } },
    { "w", desc = "Word with white spaces", icon = { icon = "󰗊 ", color = "green" } },
    { "W", desc = "WORD with white spaces", icon = { icon = "󰗊 ", color = "green" } },
    { '"', desc = "Double quoted string", icon = { icon = "󱇬 ", color = "grey" } },
    { "'", desc = "Single quoted string", icon = { icon = "󱇬 ", color = "grey" } },
    { "`", desc = "Backtick quoted string", icon = { icon = "󱇬 ", color = "grey" } },
  },

  -- ═══════════════════════════════════════════════════════════
  --  MERGED GLOBAL & ROOT KEYMAPS
  -- ═══════════════════════════════════════════════════════════
  -- Root Movements (Normal Mode)
  { "<C-I>", "<C-I>", desc = "Jump forward in jumplist", mode = "n", icon = { icon = "󰕒 ", color = "blue" } },
  { "n", "nzzzv", desc = "Next search match", mode = "n", icon = { icon = "󰮴 ", color = "azure" } },
  { "N", "Nzzzv", desc = "Prev search match", mode = "n", icon = { icon = "󰮳 ", color = "azure" } },

  -- Buffer Navigation & Management
  { "<Tab>", "<cmd>bnext<cr>", desc = "Next Buffer", mode = "n", icon = { icon = "󰄾 ", color = "azure" } },
  { "<S-Tab>", "<cmd>bprevious<cr>", desc = "Prev Buffer", mode = "n", icon = { icon = "󰄼 ", color = "azure" } },
  { "<A-d>", "<cmd>bd<cr>", desc = "Delete Current Buffer", mode = "n", icon = { icon = "󰭌 ", color = "red" } },

  -- Multi-mode Window & Terminal UI
  {
    "<esc>",
    "<cmd>nohlsearch<cr><esc>",
    desc = "Escape and Clear hlsearch",
    mode = { "i", "n" },
    icon = { icon = "󱊷 ", color = "grey" },
  },
  {
    "<A-i>",
    '<CMD>lua require("FTerm").toggle()<CR>',
    desc = "Toggle Fterm",
    mode = "n",
    icon = { icon = "󰞀 ", color = "green" },
  },
  {
    "<A-i>",
    '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>',
    desc = "Toggle Fterm",
    mode = "t",
    icon = { icon = "󰞀 ", color = "green" },
  },

  -- Smart Visual j/k Movements
  {
    "j",
    "v:count == 0 ? 'gj' : 'j'",
    desc = "Down",
    mode = { "n", "x" },
    expr = true,
    silent = true,
    icon = { icon = "󰜮 ", color = "grey" },
  },
  {
    "k",
    "v:count == 0 ? 'gk' : 'k'",
    desc = "Up",
    mode = { "n", "x" },
    expr = true,
    silent = true,
    icon = { icon = "󰜷 ", color = "grey" },
  },
  {
    "<Down>",
    "v:count == 0 ? 'gj' : 'j'",
    desc = "Down",
    mode = { "n", "x" },
    expr = true,
    silent = true,
    icon = { icon = "󰜮 ", color = "grey" },
  },
  {
    "<Up>",
    "v:count == 0 ? 'gk' : 'k'",
    desc = "Up",
    mode = { "n", "x" },
    expr = true,
    silent = true,
    icon = { icon = "󰜷 ", color = "grey" },
  },

  -- VSCode Line Swapping (Alt+j/k)
  {
    "<A-j>",
    "<cmd>execute 'move .+' . v:count1<cr>==",
    desc = "Move Line Down",
    mode = "n",
    icon = { icon = "󰜮 ", color = "grey" },
  },
  {
    "<A-k>",
    "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==",
    desc = "Move Line Up",
    mode = "n",
    icon = { icon = "󰜷 ", color = "grey" },
  },
  {
    "<A-j>",
    "<esc><cmd>m .+1<cr>==gi",
    desc = "Move Line Down",
    mode = "i",
    icon = { icon = "󰜮 ", color = "grey" },
  },
  { "<A-k>", "<esc><cmd>m .-2<cr>==gi", desc = "Move Line Up", mode = "i", icon = { icon = "󰜷 ", color = "grey" } },
  {
    "<A-j>",
    ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv",
    desc = "Move Selection Down",
    mode = "x",
    icon = { icon = "󰜮 ", color = "grey" },
  },
  {
    "<A-k>",
    ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv",
    desc = "Move Selection Up",
    mode = "x",
    icon = { icon = "󰜷 ", color = "grey" },
  },

  -- Visual Editing Core
  { "<", "<gv", desc = "Indent left and keep selection", mode = "x", icon = { icon = "󰉶 ", color = "grey" } },
  { ">", ">gv", desc = "Indent right and keep selection", mode = "x", icon = { icon = "󰉵 ", color = "grey" } },
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
    icon = { icon = "󰅌 ", color = "green" },
  },

  -- Insert Mode Break-points
  { ",", ",<c-g>u", desc = "Undo break point (,)", mode = "i", icon = { icon = "󰞋 ", color = "grey" } },
  { ".", ".<c-g>u", desc = "Undo break point (.)", mode = "i", icon = { icon = "󰞋 ", color = "grey" } },
  { ";", ";<c-g>u", desc = "Undo break point (;)", mode = "i", icon = { icon = "󰞋 ", color = "grey" } },

  -- ═══════════════════════════════════════════════════════════
  --  GROUPED MAPS (SUB-PATHS)
  -- ═══════════════════════════════════════════════════════════
  -- [ Prefix (Previous)
  { "[q", vim.cmd.cprev, desc = "Previous Quickfix", mode = "n", icon = { icon = "󰮳 ", color = "red" } },

  -- ] Prefix (Next)
  { "]q", vim.cmd.cnext, desc = "Next Quickfix", mode = "n", icon = { icon = "󰮴 ", color = "green" } },

  -- g Prefix (Goto & Helix Buffer Style)
  { "gl", "$", desc = "Go to end of line", mode = { "n", "x", "o" }, icon = { icon = "󰦡 ", color = "grey" } },
  { "gh", "^", desc = "Go to start of line", mode = { "n", "x", "o" }, icon = { icon = "󰦣 ", color = "grey" } },
  { "ge", "G", desc = "Go to end of file", mode = { "n", "x", "o" }, icon = { icon = "󰋨 ", color = "grey" } },
  { "go", "%", desc = "Jump to matching bracket", mode = { "n", "x", "o" }, icon = { icon = "󰅪 ", color = "grey" } },
  { "gd", vim.lsp.buf.definition, desc = "LSP Goto Definition", mode = "n", icon = { icon = "󰔪 ", color = "blue" } },
  { "gn", "<cmd>bnext<CR>", desc = "Next buffer", mode = "n", icon = { icon = "󰄾 ", color = "azure" } },
  { "gp", "<cmd>bprevious<CR>", desc = "Previous buffer", mode = "n", icon = { icon = "󰄼 ", color = "azure" } },

  -- Alt-based Navigation
  { "<A-h>", "^", desc = "Go to start of line", mode = { "n", "x", "o" }, icon = { icon = "󰦣 ", color = "grey" } },
  { "<A-l>", "$", desc = "Go to end of line", mode = { "n", "x", "o" }, icon = { icon = "󰦡 ", color = "grey" } },

  -- z Prefix (Fold controls)
  {
    "zv",
    "zMzvzz",
    desc = "Close all folds except the current one",
    mode = "n",
    icon = { icon = "󰘖 ", color = "grey" },
  },

  -- <leader><tab> Prefix (Tabs)
  { "<leader><tab><tab>", "<cmd>tabnew<cr>", desc = "New Tab", mode = "n", icon = { icon = "󰓩 ", color = "blue" } },
  { "<leader><tab>]", "<cmd>tabnext<cr>", desc = "Next Tab", mode = "n", icon = { icon = "󰄾 ", color = "azure" } },
  {
    "<leader><tab>[",
    "<cmd>tabprevious<cr>",
    desc = "Previous Tab",
    mode = "n",
    icon = { icon = "󰄼 ", color = "azure" },
  },
  { "<leader><tab>f", "<cmd>tabfirst<cr>", desc = "First Tab", mode = "n", icon = { icon = "󰮳 ", color = "azure" } },
  { "<leader><tab>l", "<cmd>tablast<cr>", desc = "Last Tab", mode = "n", icon = { icon = "󰮴 ", color = "azure" } },
  {
    "<leader><tab>o",
    "<cmd>tabonly<cr>",
    desc = "Close Other Tabs",
    mode = "n",
    icon = { icon = "󰭌 ", color = "red" },
  },
  { "<leader><tab>d", "<cmd>tabclose<cr>", desc = "Close Tab", mode = "n", icon = { icon = "󰭌 ", color = "red" } },

  -- <leader>b Prefix (Buffers extras)
  {
    "<leader>bb",
    "<cmd>e #<cr>",
    desc = "Switch to Other Buffer",
    mode = "n",
    icon = { icon = "󰓦 ", color = "blue" },
  },
  { "<leader>bd", "<cmd>bd<cr>", desc = "Delete Current Buffer", mode = "n", icon = { icon = "󰭌 ", color = "red" } },

  -- <leader>t Prefix (Toggles & Diagnostics)
  {
    "<leader>tw",
    "<cmd>set wrap!<CR>",
    desc = "Toggle Wrap",
    mode = "n",
    silent = true,
    icon = { icon = "󰖶 ", color = "cyan" },
  },
  { "<leader>ti", vim.show_pos, desc = "Inspect Pos", mode = "n", icon = { icon = "󰘚 ", color = "yellow" } },
  {
    "<leader>tI",
    "<cmd>InspectTree<cr>",
    desc = "Inspect Tree",
    mode = "n",
    icon = { icon = "󰙅 ", color = "yellow" },
  },
  {
    "<leader>td",
    "<cmd>TinyInlineDiag toggle<cr>",
    desc = "Toggle Inline Diagnostics",
    mode = "n",
    silent = true,
    icon = { icon = "󰙏 ", color = "orange" },
  },
  {
    "<leader>tc",
    "<cmd>TinyInlineDiag toggle_cursor_only<cr>",
    desc = "Toggle Cursor-Only Diags",
    mode = "n",
    silent = true,
    icon = { icon = "󰹹 ", color = "orange" },
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
    icon = { icon = "󰉼 ", color = "green" },
  },

  -- <leader>l Prefix (LSP & Language tools)
  {
    "<leader>ld",
    vim.diagnostic.setqflist,
    desc = "Open Diagnostic Buffer",
    mode = "n",
    icon = { icon = "󰮭 ", color = "red" },
  },
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
    icon = { icon = "󰛦 ", color = "green" },
  },

  -- <leader>q Prefix (Session Control)
  { "<leader>q", "<cmd>qa<cr>", desc = "Quit All", mode = "n", icon = { icon = "󰈆 ", color = "red" } },

  -- <leader>o Prefix (System Control Hooks)
  { "<leader>oo", "<cmd>source<CR>", desc = "Source file", mode = "n", icon = { icon = "󰑓 ", color = "cyan" } },
  { "<leader>or", "<cmd>restart<CR>", desc = "Restart", mode = "n", icon = { icon = "󰜉 ", color = "red" } },

  -- <leader>k Prefix (Translation)
  {
    "<leader>k",
    ":TranslateNormal<CR>",
    desc = "Translate word",
    mode = "n",
    icon = { icon = "󰗊 ", color = "orange" },
  },
  {
    "<leader>k",
    ":TranslateVisual<CR>",
    desc = "Translate select",
    mode = "x",
    icon = { icon = "󰗊 ", color = "orange" },
  },

  -- <leader>e Prefix (Explorer)
  { "<leader>e", "<cmd>Yazi<CR>", desc = "Yazi", mode = "n", icon = { icon = "󰇥 ", color = "green" } },
  {
    "<leader>E",
    function()
      require("oil").toggle_float()
    end,
    desc = "Oil",
    mode = "n",
    icon = { icon = "󰏇 ", color = "green" },
  },

  -- <leader>s Prefix (Television Search Engines)
  { "<leader>ss", "<cmd>Tv<cr>", desc = "Television Panel", mode = "n", icon = { icon = "󰭟 ", color = "yellow" } },
  {
    "<leader>sf",
    "<cmd>Tv files<cr>",
    desc = "Search and open files",
    mode = "n",
    icon = { icon = "󰱼 ", color = "yellow" },
  },
  {
    "<leader>sc",
    "<cmd>Tv text<cr>",
    desc = "Search text content",
    mode = "n",
    icon = { icon = "󰦨 ", color = "yellow" },
  },
  {
    "<leader>se",
    "<cmd>Tv env<cr>",
    desc = "Browse environment variables",
    mode = "n",
    icon = { icon = "󰖟 ", color = "yellow" },
  },
  {
    "<leader>sd",
    "<cmd>Tv dirs<cr>",
    desc = "Browse directories",
    mode = "n",
    icon = { icon = "󰉋 ", color = "yellow" },
  },
  {
    "<leader>sgb",
    "<cmd>Tv git-branch<cr>",
    desc = "Switch git branches",
    mode = "n",
    icon = { icon = " ", color = "purple" },
  },
  {
    "<leader>sgd",
    "<cmd>Tv git-diff<cr>",
    desc = "Browse git diffs",
    mode = "n",
    icon = { icon = " ", color = "purple" },
  },
  {
    "<leader>sgl",
    "<cmd>Tv git-log<cr>",
    desc = "Browse git commit history",
    mode = "n",
    icon = { icon = " ", color = "purple" },
  },

  -- <leader>w Prefix & Ctrl-w Helpers
  {
    "<C-h>",
    "<C-w>h",
    desc = "Go to Left Window",
    mode = "n",
    remap = true,
    icon = { icon = "󰄼 ", color = "cyan" },
  },
  {
    "<C-j>",
    "<C-w>j",
    desc = "Go to Lower Window",
    mode = "n",
    remap = true,
    icon = { icon = "󰜮 ", color = "cyan" },
  },
  {
    "<C-k>",
    "<C-w>k",
    desc = "Go to Upper Window",
    mode = "n",
    remap = true,
    icon = { icon = "󰜷 ", color = "cyan" },
  },
  {
    "<C-l>",
    "<C-w>l",
    desc = "Go to Right Window",
    mode = "n",
    remap = true,
    icon = { icon = "󰄾 ", color = "cyan" },
  },
  {
    "<C-S-Up>",
    "<cmd>resize +5<CR>",
    desc = "Resize window up",
    mode = "n",
    silent = true,
    icon = { icon = "󰜷 ", color = "grey" },
  },
  {
    "<C-S-Down>",
    "<cmd>resize -5<CR>",
    desc = "Resize window down",
    mode = "n",
    silent = true,
    icon = { icon = "󰜮 ", color = "grey" },
  },
  {
    "<C-S-Left>",
    "<cmd>vertical resize -5<CR>",
    desc = "Resize window left",
    mode = "n",
    silent = true,
    icon = { icon = "󰄼 ", color = "grey" },
  },
  {
    "<C-S-Right>",
    "<cmd>vertical resize +5<CR>",
    desc = "Resize window right",
    mode = "n",
    silent = true,
    icon = { icon = "󰄾 ", color = "grey" },
  },
  {
    "<leader>ww",
    "<C-W>p",
    desc = "Other Window",
    mode = "n",
    remap = true,
    icon = { icon = "󰖯 ", color = "cyan" },
  },
  {
    "<leader>wd",
    "<C-W>c",
    desc = "Delete Window",
    mode = "n",
    remap = true,
    icon = { icon = "󰭌 ", color = "red" },
  },
  {
    "<leader>w-",
    "<C-W>s",
    desc = "Split Window Below",
    mode = "n",
    remap = true,
    icon = { icon = "󰖰 ", color = "cyan" },
  },
  {
    "<leader>w|",
    "<C-W>v",
    desc = "Split Window Vertically",
    mode = "n",
    remap = true,
    icon = { icon = "| ", color = "cyan" },
  },
}
