-- telescope.lua
--
-- template to add plugins to lazy.nvim

-- configure the telescope plugin using lazy.nvim
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    plugins = {
      spelling = {
        enabled = true,
        suggestions = 20,
      }
    }
  }
}
