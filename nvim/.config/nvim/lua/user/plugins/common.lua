-- user/plugins/common.lua
--
-- common plugins that don't require any additional setup
--
return {
  { "nvim-lua/plenary.nvim" },
  -- surround word and lines with braces and quotes
  { "tpope/vim-surround",
    dependencies = { "tpope/vim-repeat" }
  },
  -- Tmux & split window navigation
  { "christoomey/vim-tmux-navigator", },
  -- Detect tabstop and shiftwidth automatically
  { "tpope/vim-sleuth", },
  -- Powerful Git integration for Vim
  { "tpope/vim-fugitive", },
  -- Autoclose parentheses, brackets, quotes, etc.
  -- TODO: re-evaluate this
  { "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = {},
  },
  -- Highlight todo, notes, etc in comments
  { "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = false,
      highlight = {
        before = "",
        keyword = "wide",
        after = ""
      }
    },
  },
  -- High-performance color highlighter
  -- TODO: configure this to only enable for certain file types
  { "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
}

