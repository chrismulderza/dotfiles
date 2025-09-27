-- user/plugins/nvim-treesitter.lua
--
-- load and configure treesitter

return {
  { "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "onenord",
          section_separators = { left = '|', right = '|' },
          component_separators = { left = '|', right = '|' },
          disabled_filetypes = { 'alpha', 'neo-tree' },
          always_divide_middle = true,
        }
      })
    end
  }
}

