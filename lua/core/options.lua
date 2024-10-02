vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- Appearance
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.termguicolors = true -- turn on termguicolors for true color colorschemes to work
opt.background = "dark" -- colorschemes that can be light or dark will default to dark
opt.signcolumn = "yes"  -- show sign column so that text does not shift
opt.colorcolumn = "100"

-- tabs & indentation
opt.tabstop = 2       -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2    -- 2 spaces for indent width
opt.softtabstop = 2    -- 2 spaces for soft tab width
opt.expandtab = true  -- expand tab to spaces
opt.smartindent = true -- smart autoindenting
opt.autoindent = true -- copy indent from current line when starting new one
opt.wrap = false

-- search settings
opt.incsearch = true
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive search

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, EOL, or insert mode

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true
opt.splitbelow = true

-- Behavior
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
--opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.autochdir = false
opt.iskeyword:append("-")

opt.fileformats = "unix,dos,mac"
