return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = function()
      local opts = require "nvchad.configs.telescope"

      opts.pickers = {
        find_files = {
          hidden = true,
        },
      }

      return opts
    end,
  },
}
