-- ── Leaders & Globals ──────────────────────────────────────────────
vim.g.mapleader = " " -- <Space> as leader key
vim.g.maplocalleader = "," -- <,> as local leader (used by grug-far etc.)
vim.g.editorconfig = true -- respect .editorconfig files
vim.g.root_pattern = { ".git", ".nvim", ".project.el", ".editorconfig" }
vim.g.no_plugin_maps = true -- disable default regex ftplugin jump, because treesitter-textobjects

-- ── Persistence ────────────────────────────────────────────────────
vim.opt.shada = "'100,<0" -- remember 100 marks, don't persist registers
vim.opt.swapfile = false -- disable swap files, rely on undofile instead
vim.opt.undofile = true -- persist undo history across sessions
vim.opt.undolevels = 10000 -- maximum number of undo steps
vim.opt.autowrite = true -- auto-save before :make, :next, CTRL-O, etc.

-- ── Line Display ───────────────────────────────────────────────────
vim.opt.number = true -- show absolute line number on current line
vim.opt.relativenumber = true -- show relative line numbers on other lines
vim.opt.cursorline = true -- highlight the line the cursor is on
vim.opt.wrap = true -- don't soft-wrap long lines
vim.opt.linebreak = true -- if wrap is toggled on, break at word boundaries
vim.opt.scrolloff = 5 -- keep 10 lines visible above/below cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor
vim.opt.smoothscroll = true -- scroll by screen line, not by text line
vim.opt.signcolumn = "yes" -- always show sign column (avoids layout shift)

-- ── Editing ────────────────────────────────────────────────────────
vim.opt.mouse = "a" -- enable mouse in all modes
vim.opt.virtualedit = "block" -- allow cursor beyond end-of-line in visual block
vim.opt.confirm = true -- prompt to save instead of failing on :q
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- sync with system clipboard (disabled over SSH)
vim.opt.textwidth = 80

-- ── Indentation ────────────────────────────────────────────────────
vim.opt.expandtab = true -- insert spaces instead of tabs
vim.opt.tabstop = 2 -- Tab width
vim.opt.softtabstop = 2 -- Soft tab stop
vim.o.showtabline = 2
vim.opt.shiftwidth = 2 -- indent by 2 spaces per level
vim.opt.shiftround = true -- round indent to nearest multiple of shiftwidth
vim.opt.smartindent = true -- Smart auto-indenting
vim.opt.autoindent = true -- Copy indent from current line
vim.opt.breakindent = true -- visually indent wrapped lines to match start

-- ── Search ─────────────────────────────────────────────────────────
vim.opt.hlsearch = true -- Don't highlight search results
vim.opt.incsearch = true -- Show matches as you type
vim.opt.ignorecase = true -- case-insensitive search by default
vim.opt.smartcase = true -- …unless query contains uppercase letters
vim.opt.inccommand = "nosplit" -- live preview :s substitutions as you type
vim.opt.grepformat = "%f:%l:%c:%m" -- parse ripgrep output format
vim.opt.grepprg = "rg --vimgrep" -- use ripgrep instead of grep

-- ── Windows & Splits ───────────────────────────────────────────────
vim.o.winborder = "rounded"
vim.opt.splitright = true -- :vsplit opens to the right
vim.opt.splitbelow = true -- :split opens below
vim.opt.splitkeep = "screen" -- keep text position stable when splitting
vim.opt.laststatus = 3 -- single global statusline across all splits

-- ── Folding ────────────────────────────────────────────────────────
vim.opt.foldenable = true
vim.opt.foldlevel = 99 -- open all folds by default
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr" -- use treesitter expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "" -- render fold lines with treesitter highlights

-- ── Timing ─────────────────────────────────────────────────────────
vim.opt.updatetime = 100 -- ms idle before CursorHold fires / swap writes
vim.opt.timeoutlen = 300 -- ms to wait for next key in a mapped sequence

-- ── Appearance ─────────────────────────────────────────────────────
vim.opt.termguicolors = true -- enable 24-bit RGB color in the TUI, also for nvim-highlight-colors
vim.opt.showmode = false -- don't show "-- INSERT --", statusline handles it
vim.opt.ruler = false -- don't show line/col in bottom-right, statusline handles it
vim.opt.conceallevel = 2 -- hide markup symbols (e.g. ** in markdown)
vim.opt.fillchars = {
  foldopen = " ",
  foldclose = " ",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
} -- diff filler char, hide ~ after EOF
vim.opt.list = true -- show invisible characters
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
  extends = "→",
  precedes = "←",
} -- symbols for tab/trailing/nbsp

-- ── Completion & Navigation ────────────────────────────────────────
vim.opt.wildmode = "longest:full,full" -- complete longest common, then cycle full matches
vim.opt.jumpoptions = "view" -- restore view when jumping through jumplist

-- ── Encoding ───────────────────────────────────────────────────────
vim.opt.encoding = "UTF-8" -- Set encoding
vim.opt.fileencodings = { -- try these encodings when reading a file
  "ucs-bom",
  "utf-8",
  "gb18030",
  "gbk",
  "gb2312",
  "latin1",
}

-- ── Diagnostics ────────────────────────────────────────────────────
vim.diagnostic.config({
  float = {
    focusable = true, -- allow focusing the float window
    close_events = { "BufHidden", "BufLeave" }, -- auto-close when leaving buffer
    border = "rounded", -- rounded border style
    source = "if_many", -- show source name when multiple sources
  },
})

-- ── File handling ───────────────────────────────────────────────────
vim.opt.backup = false -- Don't create backup files
vim.opt.writebackup = false -- Don't create backup before writing
vim.opt.undodir = vim.fn.expand("~/.local/share/nvim/vim/undodir") -- Undo directory
vim.opt.ttimeoutlen = 0 -- Key code timeout
vim.opt.autoread = true -- Auto reload files changed outside vim

-- Visual settings
vim.opt.colorcolumn = "+1"
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.matchtime = 1 -- How long to show matching bracket
vim.opt.cmdheight = 1 -- Command line height
vim.opt.pumheight = 10 -- Popup menu height
vim.opt.pumblend = 10 -- Popup menu transparency
vim.opt.winblend = 10 -- Floating window transparency
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.concealcursor = "" -- Don't hide cursor line markup
vim.opt.synmaxcol = 300 -- Syntax highlighting limit
vim.opt.winminwidth = 5 -- Minimum window width

-- Behavior settings
vim.opt.hidden = true -- Allow hidden buffers
vim.opt.iskeyword:remove("=")
vim.opt.iskeyword:remove(";")
vim.opt.iskeyword:remove(",")
vim.opt.iskeyword:remove("{")
vim.opt.iskeyword:remove("}")
vim.opt.iskeyword:remove("(")
vim.opt.iskeyword:remove(")")
vim.opt.iskeyword:remove("?")
vim.opt.path:append("**") -- include subdirectories in search
vim.opt.wildignore:append("**/node_modules/**,**/build/**,**/.git/**")

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

vim.g.autoformat = true
vim.g.trouble_lualine = true
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.g.markdown_recommended_style = 0
