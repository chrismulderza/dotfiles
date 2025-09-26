--- keymaps.lua
--
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- diagnostics toggle for lsp
vim.keymap.set("n", "<leader>dt", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)
vim.keymap.set("n", "<leader>dn", function()
  vim.diagnostic.goto_next()
end)
vim.keymap.set("n", "<leader>dp", function()
  vim.diagnostic.goto_previous()
end)
