-- lualine.lua
--
-- configure lualine plugin using lazy.nvim
return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function ()
        local status_ok, lualine = pcall(require, 'lualine')
        if not status_ok then
            return
        end

        lualine.setup({
            options = {
                icons_enabled = false,
                theme = 'auto',
            },
            sections = {
                lualine_a = {
                    {
                        'filename',
                        path = 1,
                    },
                },
            },
        })
    end
}
