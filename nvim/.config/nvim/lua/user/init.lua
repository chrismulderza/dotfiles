-- user/init.lua
--
-- some basics
vim.g.mapleader = " "

-- initalise core settings first
--
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




