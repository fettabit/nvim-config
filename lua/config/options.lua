-- ─── Active options ──────────────────────────────────────────────────────────

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.inccommand = "split" -- live preview of :s substitutions in a split

vim.opt.clipboard:append("unnamedplus")
vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "0"
vim.o.cmdheight = 0

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.hl.on_yank()
	end,
})

-- ─── Display & UI ────────────────────────────────────────────────────────────

vim.opt.termguicolors = true -- 24-bit RGB colours (required by most colour schemes)
-- vim.opt.background    = "dark"        -- hint to colour schemes ("dark" or "light")
-- vim.opt.cmdheight     = 1             -- command-bar height (0 = hidden until needed)
-- vim.opt.laststatus    = 2             -- 0=never 1=multi-window 2=always 3=global single bar
-- vim.opt.showmode      = false         -- hide "-- INSERT --" (lualine replaces it)
-- vim.opt.showcmd       = true          -- show partial command in the status bar
-- vim.opt.ruler         = true          -- show cursor line/col in status bar
-- vim.opt.colorcolumn   = "80"          -- highlight guide column (comma-sep list ok)
-- vim.opt.signcolumn    = "yes"         -- always show sign column (avoids layout shift on LSP)
-- vim.opt.conceallevel  = 0             -- 0=show all  1=one char  2=hidden+replacement  3=fully hidden
-- vim.opt.concealcursor = ""            -- modes where conceal applies: n v i c
-- vim.opt.list          = false         -- show invisible characters defined in listchars
-- vim.opt.listchars     = { tab = "→ ", trail = "·", nbsp = "␣", eol = "↵" }
-- vim.opt.showbreak     = "↪ "         -- prefix shown at start of every wrapped line
-- vim.opt.title         = true          -- update terminal window title
-- vim.opt.titlestring   = "%t – nvim"  -- format for the terminal title (%t = filename)
-- vim.opt.visualbell    = true          -- flash screen instead of beeping
-- vim.opt.belloff       = "all"         -- silence bell completely
-- vim.opt.fillchars     = { eob = " " } -- character for empty lines below buffer (default "~")
-- vim.opt.winblend      = 0             -- floating window transparency (0=opaque 100=transparent)
-- vim.opt.pumblend      = 0             -- completion popup transparency

-- ─── Search ──────────────────────────────────────────────────────────────────

-- vim.opt.ignorecase = true             -- case-insensitive search patterns
-- vim.opt.smartcase  = true             -- re-enable case when pattern contains uppercase
-- vim.opt.hlsearch   = true             -- keep matches highlighted after search
-- vim.opt.incsearch  = true             -- show match incrementally while typing (nvim default)
-- vim.opt.wrapscan   = true             -- search wraps around end of file (nvim default)

-- ─── Scrolling ───────────────────────────────────────────────────────────────

-- vim.opt.scrolloff     = 8             -- min lines to keep above/below cursor
-- vim.opt.sidescrolloff = 8             -- min columns to keep left/right of cursor
-- vim.opt.sidescroll    = 1             -- columns scrolled per step when wrap=false

-- ─── Editing & behaviour ─────────────────────────────────────────────────────

-- vim.opt.hidden      = true            -- hide (not close) abandoned buffers
-- vim.opt.confirm     = true            -- prompt to save instead of failing
-- vim.opt.autoread    = true            -- reload file when changed outside nvim
-- vim.opt.autowrite   = false           -- auto-save before :next :make etc.
-- vim.opt.clipboard   = "unnamedplus"   -- sync yank/paste with system clipboard
-- vim.opt.mouse       = "a"             -- enable mouse in all modes ("" to disable)
-- vim.opt.virtualedit = "block"         -- allow cursor beyond EOL in Visual-block
-- vim.opt.joinspaces  = false           -- single space after period on J (not double)
-- vim.opt.gdefault    = false           -- don't add 'g' flag to :s by default
-- vim.opt.selection   = "inclusive"     -- selection includes the last character
-- vim.opt.startofline = false           -- keep cursor column during Ctrl-U/D/F/B

-- ─── Indentation (advanced) ──────────────────────────────────────────────────

-- vim.opt.autoindent    = true          -- copy indent from current line on <CR>
-- vim.opt.copyindent    = false         -- replicate exact tab+space indent structure
-- vim.opt.preserveindent= false         -- preserve mix of tabs/spaces on re-indent
-- vim.opt.cindent       = false         -- strict C-style automatic indentation
-- vim.opt.smarttab      = true          -- Tab at line start uses shiftwidth (nvim default)

-- ─── Wrapping & text formatting ──────────────────────────────────────────────

-- vim.opt.textwidth    = 0              -- auto-wrap at this column (0 = off)
-- vim.opt.wrapmargin   = 0              -- wrap when within N chars of right margin
-- vim.opt.breakindent  = false          -- wrapped lines indent to match their start
-- vim.opt.formatoptions= "tcqj"         -- t=wrap c=comments q=gq j=remove comment leader on join
-- vim.opt.linebreak    = false          -- only wrap at breakat characters

-- ─── Splits & windows ────────────────────────────────────────────────────────

-- vim.opt.winwidth    = 10              -- min width of the active window
-- vim.opt.winheight   = 1               -- min height of the active window
-- vim.opt.winminwidth = 1               -- min width of any window
-- vim.opt.winminheight= 1               -- min height of any window
-- vim.opt.equalalways = true            -- re-equalise windows after split/close

-- ─── Completion ──────────────────────────────────────────────────────────────

-- vim.opt.completeopt = { "menu", "menuone", "noselect" }  -- recommended for nvim-cmp
-- vim.opt.pumheight   = 10              -- max visible items in completion popup
vim.opt.wildmenu = true -- enhanced cmdline completion menu
-- vim.opt.wildmode    = "longest:full,full"  -- completion stepping behaviour
-- vim.opt.wildignore  = "*.o,*.obj,*.pyc,node_modules/**,.git/**"

-- ─── Files & undo ────────────────────────────────────────────────────────────

-- vim.opt.swapfile    = false           -- disable swap files
-- vim.opt.backup      = false           -- don't keep backup after successful write
-- vim.opt.writebackup = true            -- write a backup during save, delete on success
-- vim.opt.undofile    = true            -- persist undo history across sessions
-- vim.opt.undodir     = vim.fn.stdpath("data") .. "/undo"  -- undo file location
-- vim.opt.undolevels  = 1000            -- max number of changes that can be undone
-- vim.opt.fileencoding= "utf-8"         -- encoding written to file
-- vim.opt.fileformat  = "unix"          -- line ending style (unix / dos / mac)

-- ─── Performance ─────────────────────────────────────────────────────────────

-- vim.opt.updatetime  = 250             -- ms idle before CursorHold fires & swap written
-- vim.opt.timeoutlen  = 300             -- ms to wait for a key-map sequence to complete
-- vim.opt.ttimeoutlen = 10              -- ms to wait for a terminal escape sequence
-- vim.opt.lazyredraw  = false           -- skip redraws during macros (can break plugins)
-- vim.opt.synmaxcol   = 240            -- stop syntax highlighting past this column

-- ─── Folding ─────────────────────────────────────────────────────────────────

-- vim.opt.foldenable     = true         -- enable code folding
-- vim.opt.foldlevel      = 99           -- open all folds by default (set high)
-- vim.opt.foldlevelstart = 99           -- foldlevel when a new buffer is opened
-- vim.opt.foldmethod     = "indent"     -- manual / indent / syntax / expr / marker / diff
-- vim.opt.foldminlines   = 1            -- min lines required before a fold is shown
-- vim.opt.foldnestmax    = 10           -- max nesting depth for indent/syntax folds

-- ─── Spell checking ──────────────────────────────────────────────────────────

vim.opt.spell = true -- enable spell checking
vim.opt.spelllang = { "en_us" } -- languages to check (comma-sep list)
vim.opt.spellsuggest = "best,9" -- max spell suggestions to show

-- ─── Grep / quickfix ─────────────────────────────────────────────────────────

-- vim.opt.grepprg    = "rg --vimgrep"   -- use ripgrep for :grep
-- vim.opt.grepformat = "%f:%l:%c:%m"    -- parse ripgrep output into the quickfix list

-- ─── Misc ────────────────────────────────────────────────────────────────────

-- vim.opt.exrc        = true            -- auto-load .nvim.lua from project directories
-- vim.opt.autochdir   = false           -- cd to the directory of the current file
-- vim.opt.modeline    = true            -- honour vim: modelines inside files
-- vim.opt.report      = 2               -- show message when >= N lines are changed
-- vim.opt.history     = 10000           -- number of : and / entries kept in history
-- vim.opt.shortmess:append("c")         -- suppress "match N of M" completion messages
-- vim.opt.path:append("**")             -- :find searches recursively into subdirs
-- vim.opt.tags        = "./tags;,tags"  -- ctags file search path
-- vim.opt.matchpairs:append("<:>")      -- add <> to the pairs matched by %
