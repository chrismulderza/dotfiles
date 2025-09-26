-- user/plugins/common.lua
--
-- common plugins that don't require any additional setup
--
return {
  { "nvim-lua/plenary.nvim" },
  { "tpope/vim-surround",
    dependencies = { "tpope/vim-repeat" }
  },
}

