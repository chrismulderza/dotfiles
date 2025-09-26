--- keymaps.lua
-- alternate write of file
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- diagnostics toggle for lsp
vim.keymap.set("n", "<leader>dt", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)
-- jump to next diagnostic messgae
vim.keymap.set("n", "<leader>dn", function()
  vim.diagnostic.goto_next()
end)
-- jump to previous diagnostic messgae
vim.keymap.set("n", "<leader>dp", function()
  vim.diagnostic.goto_previous()
end)

-- move the visually selected line up
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- move the visually selected line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- replace the word under the cursor with the one provided
vim.keymap.set("n", "<leader>fr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


