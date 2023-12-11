vim.opt.wrap = true
vim.opt.textwidth = 79
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.colorcolumn = "80"

-- autogroup to fix paragraphs after insert

--[[
vim.cmd [[
    augroup mdFormatting
    autocmd!
    autocmd InsertLeave * normal gwap<CR>
    augroup END
]]
--]]
