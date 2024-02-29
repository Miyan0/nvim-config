local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

--tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true -- case insensive unless search word is capitalize

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes" -- margin bar on the left

-- make backspace key work properly
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard when yanking

-- split windows
opt.splitright = true
opt.splitbelow = true

-- let neovim consider 'dash' as part of the word
opt.iskeyword:append("-")

-- keep at least 8 chars at the bottom of the buffer
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")
