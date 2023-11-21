-- options.lua
--
-- Neovim configuration options
--

-- set the global mapleader
vim.g.mapleader = " "

local set = vim.opt

-- show line numbers
set.number = true
-- use relative line numbers
set.relativenumber = true
-- enables 24-bit RGB color support in TUI
set.termguicolors = true
-- set sensible tabstops
set.softtabstop = 4
set.tabstop = 4
set.shiftwidth = 4
-- expand tabs into spaces
set.expandtab = true
-- set a column marker
set.colorcolumn = "80"
