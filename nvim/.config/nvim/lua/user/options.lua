--- optons.lua
---
--- nvim options customised

--- editor settings {{{
--
-- encoding
vim.o.encoding="utf-8"
-- the encoding written to a file
-- this seems to break nvim sometimes
-- vim.o.fileencoding = "utf-8"
-- do we even need to do this
vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")
vim.cmd("language en_US.utf-8")
-- no bells and flashes
vim.o.visualbell = false
vim.o.errorbells = false
-- set height of status line
vim.o.laststatus = 2
-- split window below/right when creating horizontal/vertical windows
vim.o.splitbelow = true
vim.o.splitright = true
-- always use clipboard for all delete, yank, change
vim.opt.clipboard:append { "unnamed", "unnamedplus" }
-- time in milliseconds to wait for a mapped sequence to complete
vim.o.timeoutlen = 350
-- for CursorHold events
vim.o.updatetime = 300
-- don't create a swapfile
vim.o.swapfile = false
-- separate Vim plugins from Neovim in case Vim still in use
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")
-- Don't give |ins-completion-menu| messages (default: does not include 'c')
vim.opt.shortmess:append("c")
-- allow virtualedit in block edit
vim.o.virtualedit = "block"
-- pop up menu height and blend
vim.o.pumheight = 15
vim.o.pumblend = 5
-- command history
vim.o.history = 200
-- change the window title
vim.o.title = true
vim.opt.titlestring = ""
--vim.opt.titlestring:append {"%(%{hostname()}  %)"}
--vim.opt.titlestring:append {"%(%{expand('%:p')}  %)"}
--vim.opt.titlestring:append {"%{strftime('%Y-%m-%d %H:%M',getftime(expand('%')))"}
-- search options
-- incremental search
vim.o.incsearch = true
-- set highlight on search
vim.o.hlsearch = false
vim.o.cmdheight = 1
-- enable mouse in normal,insert,copy mode
vim.o.mouse = "nic"
vim.o.mousemodel = "popup"
-- creates a backup file
vim.o.backup = false
-- if a file is being edited by another program, it is not allowed to be edited
vim.o.writebackup = false
-- save undo history
vim.o.undofile = true
--
--- }}}

--- display settings {{{
--
-- changing fillchars for folding, so there is no garbage charactes
vim.o.fillchars = "fold: ,vert:|"
-- make line numbers default
vim.wo.number = true
-- character to show before the lines that have been soft-wrapped
vim.o.showbreak = "↪"
-- no relative numbering
vim.o.relativenumber = false
-- minimal number of screen lines to keep above and below the cursor
vim.o.scrolloff = 3
-- minimal number of screen columns either side of cursor
vim.o.sidescrolloff = 8
-- highlight the current line
vim.o.cursorline = true
--
--- }}}

--- text editing {{{
--
-- case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
-- spelling languages, Kings English preferred
vim.o.spelllang = "en_gb,en_us"
-- smart case (default: false)
vim.o.smartcase = true
-- the number of spaces inserted for each indentation
vim.o.shiftwidth = 2
-- insert n spaces for a tab
vim.o.tabstop = 2
-- number of spaces that a tab counts for
vim.o.softtabstop = 2
-- convert tabs to spaces
vim.o.expandtab = true
-- display lines as one long line
vim.o.wrap = false
-- companion to wrap, don't split words
vim.o.linebreak = true
-- default text width
vim.o.textwidth = 80
-- mark the column
vim.o.colorcolumn = "80"
-- keep the signcolumn on
vim.wo.signcolumn = "yes"
-- always show tabs for open files.
vim.o.showtabline = 2
-- mode in which cursorline text can be concealed
vim.o.concealcursor = "nc"
-- stop highlighting after a certain column
vim.o.synmaxcol = 500
-- fileformats to use for new files
vim.o.fileformats = "unix,dos"
-- ask for confirmation
vim.o.confirm = true
-- copy indent from current line when starting new one
vim.o.autoindent = true
-- make indenting smarter again
vim.o.smartindent = true
-- allow backspace
vim.o.backspace = "indent,eol,start"
-- enable break indent
vim.o.breakindent = true
-- level to start folding
vim.o.foldlevel = 0
-- space in the command line for displaying messages
vim.o.inccommand = "nosplit"
vim.o.matchpairs = "(:),{:},[:],<:>"
-- how to complete wildcards
vim.o.wildmode = "list:full"
vim.o.wildmenu = true
-- ignore certain files in globbing
vim.opt.wildignore:append {"*.o,*.obj,*.bin,*.dll,*.exe"}
vim.opt.wildignore:append {"*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**"}
vim.opt.wildignore:append {"*.pyc"}
vim.opt.wildignore:append {"*.DS_Store"}
vim.opt.wildignore:append {"*/.zk"}
-- vim.o.wildignore:append {""}
-- list mode and custom listchars
vim.o.list = true
vim.o.listchars = "tab:▸ ,extends:❯,precedes:❮,nbsp:+"
-- which "horizontal" keys are allowed to travel to prev/next line
vim.o.whichwrap = "bs[]"
-- align indent to next multiple value of shiftwidth
vim.o.shiftround = true
-- don't join spaces after a period, i.e. no double space
vim.o.joinspaces = false
-- set completeopt to have a better completion experience
vim.o.completeopt = "menuone"
vim.opt.complete:append {"k","kspell"}
vim.opt.complete:remove {"w","u"}
-- format options
vim.opt.formatoptions:append {"tcpnmM"}
vim.opt.formatoptions:remove {"o"}
vim.o.formatlistpat = "^\\s*\\d\\+\\.\\s\\+\\|^\\s*[-*+]\\s\\+"

--vim.o.foldmethod = 'expr'
--vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
--- }}}

