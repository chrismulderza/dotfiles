-- lsp.lua
-- Configure lsp


-- setup autocommand to enable deatures based on client capabilities
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/completion') then
      -- Optional: trigger autocompletion on EVERY keypress. May be slow!
      local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      client.server_capabilities.completionProvider.triggerCharacters = chars
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})

-- enable lua lsps, ensure there is a corresponding lua file in the `lsp`
-- directory.
--
-- lua
vim.lsp.enable("lua_ls")
vim.lsp.enable("marksman")
-- turn on inline diagnostics text 
vim.diagnostic.config({
  virtual_text = true
})
vim.cmd [[set completeopt+=menuone,noselect,popup]]
