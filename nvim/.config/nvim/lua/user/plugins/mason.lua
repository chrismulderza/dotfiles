-- user/plugins/mason.lua
--
-- configure mason to automagically manager LSP servers
--
local M = {
  { "mason-org/mason.nvim",
    enabled = false,
    config = function()
      require("mason").setup()
    end
  },
  { "mason-org/mason-lspconfig.nvim",
    enabled = false,
    after = "mason.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
        "lua_ls",
        "marksman"
        },
      })
    end
  }
}

return M
