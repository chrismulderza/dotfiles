-- Neovim configuration loader
-- load standard configuration options
require("bitbuild.options")
-- load and configure package manager
require("bitbuild.packages")
-- load custom keymaps, we load this after the packages
-- in case we want to build keymaps based on installed
-- plugins.
require("bitbuild.keymaps")
-- finally we load/configure options for our colour scheme
-- (that's colour not "color", king's English.
require("bitbuild.colourscheme")
