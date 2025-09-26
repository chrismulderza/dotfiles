--- autocmds.lua
--

-- remove trailing white spaces
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("TrimTrailingWhitespace", { clear = true }),
  pattern = { "*" }, -- Apply to all file types
  callback = function(ev)
    -- Save current cursor position to restore it after trimming
    local curpos = vim.api.nvim_win_get_cursor(0)

    -- Execute Vim command to remove trailing whitespace
    vim.cmd([[keeppatterns %s/\v\s+$//e]])

    -- Restore cursor position
    vim.api.nvim_win_set_cursor(0, curpos)
  end,
})

-- set textwidth for text file types
vim.api.nvim_create_autocmd({"BufNewFile","BufRead"}, {
  group = vim.api.nvim_create_augroup("TextFileWidth", { clear = true}),
  pattern = {"*.md","*.MD","*.markdown"},
  callback = function(ev)
    vim.o.textwidth = 79
  end,
})
