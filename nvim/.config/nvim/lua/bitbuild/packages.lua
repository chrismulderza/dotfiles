-- packages.lua
--
-- Configure a package manager for Neovim. Originaly started with packer.nvim
-- which has now become unmaintained.
--
-- lazy.nvim seems to be the most popular, and most active project at the
-- moment

-- taken from Github page
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')
