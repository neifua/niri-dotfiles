return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
    },
    keys = {
      { "<c-Left>", "<cmd>TmuxNavigateLeft<cr>" },
      { "<c-Down>", "<cmd>TmuxNavigateDown<cr>" },
      { "<c-Up>", "<cmd>TmuxNavigateUp<cr>" },
      { "<c-Right>", "<cmd>TmuxNavigateRight<cr>" },
    },
  },
}
