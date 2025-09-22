
-- initalise core settings first
--
-- load custom options
require("config.1_options")
-- load custom functions
require("config.2_functions")
-- load custom keymaps
require("config.keymaps")

--- setup plugins
---
--- load plugin manager
require("config.plugins")

--- setup plugins with dependencies
---
--- setup before LSP for better highlighting
require("config.treesitter")
--- language servers
require("config.lsp")
--- completions
require("config.completion")
--- picker(s)
require("config.picker")

--- post plugin configuration
---
--- autocommands
require("config.autocmds")
--- UI components
require("config.colors")
--- highlights
require("config.highlights")
--- filetypes
require("config.filetypes")


