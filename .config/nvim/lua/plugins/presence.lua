return {
  {
    "andweeb/presence.nvim",
    event = "UIEnter",
    config = function()
      require("presence").setup {
        -- General options
        auto_update = true,
        neovim_image_text = "Neovim",
        main_image = "neovim",
        log_level = nil,
        debounce_timeout = 10,
        enable_line_number = false,
        blacklist = {},
        blacklist_repos = {},
        buttons = true,
        file_assets = {},
        show_time = true,

        -- Rich Presence text options
        editing_text = "Editing %s",
        file_explorer_text = "Browsing %s",
        git_commit_text = "Committing changes",
        plugin_manager_text = "Managing plugins",
        reading_text = "Reading %s",
        workspace_text = "Working on %s",
        line_number_text = "Line %s out of %s",
      }
    end,
  },
}
