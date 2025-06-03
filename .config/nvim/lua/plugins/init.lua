return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
    lazy = false,
  },

  {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup()
  end,
  lazy = false, 
  },

  {
  'brianhuster/live-preview.nvim',
  dependencies = {
      'nvim-telescope/telescope.nvim', -- or 'ibhagwan/fzf-lua', or 'echasnovski/mini.pick'
  },
  config = function()
    require("live-preview").setup()
  end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
   "nvim-treesitter/nvim-treesitter",
   	opts = {
   		ensure_installed = {
   			"vim", "lua", "vimdoc",
        "html", "css"
   	  },
    },
  },
}
