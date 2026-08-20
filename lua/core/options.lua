local g = vim.g
local opt = vim.opt

g.mapleader = " " -- <Space> as leader key
g.maplocalleader = "," -- <,> as local leader (used by grug-far etc.)

-- ── Leaders & Globals ──────────────────────────────────────────────
g.editorconfig = true -- respect .editorconfig files
g.root_pattern = { ".git" }
g.no_plugin_maps = true -- disable default regex ftplugin jump, because treesitter-textobjects

-- ── Persistence ────────────────────────────────────────────────────
opt.shada = "'100,<0" -- remember 100 marks, don't persist registers
opt.swapfile = false -- disable swap files, rely on undofile instead
opt.undofile = true -- persist undo history across sessions
opt.undolevels = 10000 -- maximum number of undo steps
opt.autowrite = true -- auto-save before :make, :next, CTRL-O, etc.

-- ── Line Display ───────────────────────────────────────────────────
opt.number = true -- show absolute line number on current line
opt.relativenumber = true -- show relative line numbers on other lines
opt.cursorline = false -- highlight the line the cursor is on
opt.wrap = false -- don't soft-wrap long lines
opt.linebreak = false -- if wrap is toggled on, break at word boundaries
opt.scrolloff = 5 -- keep 10 lines visible above/below cursor
opt.sidescrolloff = 8 -- Keep 8 columns left/right of cursor
opt.smoothscroll = true -- scroll by screen line, not by text line
opt.signcolumn = "yes" -- always show sign column (avoids layout shift)

-- ── Editing ────────────────────────────────────────────────────────
opt.mouse = "" -- enable mouse in all modes
opt.virtualedit = "block" -- allow cursor beyond end-of-line in visual block
opt.confirm = true -- prompt to save instead of failing on :q
opt.clipboard = "unnamedplus" -- sync with system clipboard (disabled over SSH)
opt.textwidth = 0

-- ── Indentation ────────────────────────────────────────────────────
opt.expandtab = true -- insert spaces instead of tabs
opt.tabstop = 2 -- Tab width
opt.softtabstop = 2 -- Soft tab stop
vim.o.showtabline = 2
opt.shiftwidth = 2 -- indent by 2 spaces per level
opt.shiftround = true -- round indent to nearest multiple of shiftwidth
opt.smartindent = true -- Smart auto-indenting
opt.autoindent = true -- Copy indent from current line
opt.breakindent = true -- visually indent wrapped lines to match start
-- vim.bo.indentexpr = "v:lua.vim.treesitter.indentexpr()"

-- ── Search ─────────────────────────────────────────────────────────
opt.hlsearch = true -- Don't highlight search results
opt.incsearch = true -- Show matches as you type
opt.ignorecase = true -- case-insensitive search by default
opt.smartcase = true -- …unless query contains uppercase letters
opt.inccommand = "nosplit" -- live preview :s substitutions as you type
opt.grepformat = "%f:%l:%c:%m" -- parse ripgrep output format
opt.grepprg = "rg --vimgrep" -- use ripgrep instead of grep

-- ── Windows & Splits ───────────────────────────────────────────────
vim.o.winborder = "rounded"
opt.splitright = true -- :vsplit opens to the right
opt.splitbelow = true -- :split opens below
opt.splitkeep = "screen" -- keep text position stable when splitting
opt.laststatus = 3 -- single global statusline across all splits

-- ── Folding ────────────────────────────────────────────────────────
opt.foldenable = true
opt.foldlevel = 99 -- open all folds by default
opt.foldlevelstart = 99
opt.foldmethod = "expr" -- use treesitter expression for folding
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = "" -- render fold lines with treesitter highlights

-- ── Timing ─────────────────────────────────────────────────────────
opt.updatetime = 100 -- ms idle before CursorHold fires / swap writes
opt.timeoutlen = 300 -- ms to wait for next key in a mapped sequence

-- ── Appearance ─────────────────────────────────────────────────────
opt.termguicolors = true -- enable 24-bit RGB color in the TUI, also for nvim-highlight-colors
opt.showmode = false -- don't show "-- INSERT --", statusline handles it
opt.ruler = false -- don't show line/col in bottom-right, statusline handles it
opt.conceallevel = 1 -- hide markup symbols (e.g. ** in markdown)
opt.fillchars = {
  foldopen = " ",
  foldclose = " ",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
} -- diff filler char, hide ~ after EOF
opt.list = true -- show invisible characters
opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
  extends = "→",
  precedes = "←",
} -- symbols for tab/trailing/nbsp

-- ── Completion & Navigation ────────────────────────────────────────
opt.wildmode = "longest:full,full" -- complete longest common, then cycle full matches
opt.jumpoptions = { "stack", "view" } -- restore view when jumping through jumplist

-- ── Encoding ───────────────────────────────────────────────────────
opt.encoding = "UTF-8" -- Set encoding
opt.fileencodings = {
  "ucs-bom",
  "utf-8",
  "shift-jis",
  "gb18030",
  "gbk",
  "cp932",
  "big5",
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
opt.backup = false -- Don't create backup files
opt.writebackup = false -- Don't create backup before writing
opt.undodir = vim.fn.expand("~/.local/share/nvim/vim/undodir") -- Undo directory
opt.ttimeoutlen = 0 -- Key code timeout
opt.autoread = true -- Auto reload files changed outside vim

-- Visual settings
-- opt.colorcolumn = "+1"
opt.showmatch = true -- Highlight matching brackets
opt.matchtime = 1 -- How long to show matching bracket
opt.cmdheight = 1 -- Command line height
opt.pumheight = 10 -- Popup menu height
opt.pumblend = 10 -- Popup menu transparency
opt.winblend = 10 -- Floating window transparency
opt.completeopt = "menu,menuone,noselect"
opt.concealcursor = "" -- Don't hide cursor line markup
opt.synmaxcol = 300 -- Syntax highlighting limit
opt.winminwidth = 5 -- Minimum window width

-- Behavior settings
opt.hidden = true -- Allow hidden buffers
opt.iskeyword = "_,A-Z,a-z,48-57"
opt.path:append("**") -- include subdirectories in search
opt.wildignore:append("**/node_modules/**,**/build/**,**/.git/**,**/target/**")

-- Performance improvements
opt.redrawtime = 5000
opt.maxmempattern = 20000

g.autoformat = true
g.trouble_lualine = true
opt.shortmess:append({ W = true, I = false, c = true, C = true })
g.markdown_recommended_style = 0

-- Disable builtin plugins replaced by third-party alternatives
g.loaded_netrwPlugin = 1
g.loaded_netrw = 1
g.loaded_matchit = 1
