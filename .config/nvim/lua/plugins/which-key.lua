return {
  {
    "folke/which-key.nvim",
    cmd = "WhichKey",
    opts = function()
      dofile(vim.g.base46_cache .. "whichkey")
      return {}
    end,
  },

  require("which-key").setup {
    delay = 0,
  },
}
