return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    -- Define custom highlight groups
    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#c4a7e7", bold = true })
    vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#9ccfd8" })
    vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#eb6f92", italic = true })

    local dashboard = require "alpha.themes.dashboard"

    local logo = [[
                     .-~~~-
                .-~~~_._~~~\   
                /~-~~   ~.  `._ 
               /    \     \  | ~~-_ 
       __     |      |     | |  /~\|
   _-~~  ~~-..|       ______||/__..-~~/
    ~-.___     \     /~\_________.-~~
         \~~--._\   |             /
          ^-_    ~\  \          /^
             ^~---|~~~~-.___.-~^
               /~^| | | |^~\
              //~^`/ /_/ ^~\\
              /   //~||      \
                 ~   ||
          ___      -(||      __ ___ _
         |\|  \       ||_.-~~ /|\-  \~-._
         | -\| |      ||/   /  | |\- | |\ \
          \__-\|______ ||  |    \___\|  \_\|
    _____ _.-~/|\     \\||  \  |  /       ~-.
  /'  --/|  / /|  \    \||    \ /          |\~-
 ' ---/| | |   |\  |     ||                 \__|
| --/| | ;  \ /|  /    -(||
`./  |  /     \|/        ||)-
  `~^~^                  ||
    ]]

    dashboard.section.header.val = vim.split(logo, "\n")
    dashboard.section.header.opts.hl = "AlphaHeader"

    dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " Find File", "<cmd>Telescope find_files no_ignore=true hidden=true<CR>"),
      dashboard.button("n", " " .. " New File", "<cmd>ene <BAR> startinsert<cr>"),
      dashboard.button("r", " " .. " Recent Files", "<cmd>Telescope oldfiles<cr>"),
      dashboard.button("g", " " .. " Find Text", "<cmd>Telescope live_grep<cr>"),
      dashboard.button("q", " " .. " Quit", "<cmd>qa<cr>"),
    }

    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end

    dashboard.section.footer.opts.hl = "AlphaFooter"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.opts.layout[1].val = 3

    require("alpha").setup(dashboard.opts)
  end,
}
