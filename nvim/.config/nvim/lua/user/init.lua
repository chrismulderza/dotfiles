-- user/init.lua
--
-- early init options
vim.g.mapleader = " "
-- set termguicolors to enable highlight groups. still needed?
vim.opt.termguicolors = true
-- load lazy plugin manager, initialise plugins first before creating user
-- specific configurations
require("user.lazy")
-- options
require("user.options")
--- configure lsps
require("user.lsp")
-- appearance, all the pretty colours
require("user.appearance")
-- user functions
require("user.functions")
-- user autocmds
require("user.autocmds")
-- user keymaps
require("user.keymaps")
