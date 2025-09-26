-- user/plugins/nvim-treesitter.lua
--
-- load and configure treesitter

return {
  { "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = { theme = "onenord" }
      })
    end
  }
}

