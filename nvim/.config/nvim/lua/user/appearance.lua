-- appearance.lua
--
-- controls options and configuration that sets the appearance of our neovim
-- environment
--
-- give popup windows a rounded border
vim.opt.winborder = "rounded"
-- colorscheme
require('onenord').setup()
