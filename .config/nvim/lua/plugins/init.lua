return {
  { import = "nvchad.blink.lazyspec" },

  { "nvim-lua/plenary.nvim", lazy = true },

  {
    "nvchad/base46",
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "nvchad/ui",
    lazy = false,
    config = function()
      require "nvchad"
    end,
  },

  "nvzone/volt",
  "nvzone/menu",
  { "nvzone/minty", cmd = { "Huefy", "Shades" } },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    opts = {
      indent = { char = "│", highlight = "IblChar" },
      scope = { char = "│", highlight = "IblScopeChar" },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "blankline")

      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require("ibl").setup(opts)

      dofile(vim.g.base46_cache .. "blankline")
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "nvchad.configs.nvimtree"
    end,
  },

  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
    opts = function()
      dofile(vim.g.base46_cache .. "whichkey")
      return {}
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      return require "nvchad.configs.gitsigns"
    end,
  },

  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = function()
      return require "nvchad.configs.mason"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require "nvchad.configs.luasnip"
        end,
      },

      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "https://codeberg.org/FelipeLema/cmp-async-path.git",
      },
    },
    opts = function()
      return require "nvchad.configs.cmp"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = function()
      return require "nvchad.configs.telescope"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          node_decremental = "<BS>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]a"] = "@parameter.inner",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
            ["]A"] = "@parameter.inner",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["[a"] = "@parameter.inner",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
            ["[A"] = "@parameter.inner",
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    event = "BufReadPost",
  },

  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    opts = {},
  },

  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>cF"] = { name = "+Format Injected Langs" },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cF",
        function()
          require("conform").format {
            formatters = { "injected" },
            timeout_ms = 3000,
          }
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
    },
    opts = {
      format_on_save = {
        timeout_ms = 3000,
        lsp_fallback = true,
      },

      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "beautysh" },
        bash = { "beautysh" },
        zsh = { "beautysh" },
        python = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        markdown = { "prettier" },
        markdown_inline = { "prettier" },
        toml = { "pyproject-fmt" },
        rust = { "ast-grep" },
        go = { "ast-grep" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        cs = { "clang-format" },
        cmake = { "cmakelang" },
        java = { "clang_format" },
      },

      formatters = {
        injected = { options = { ignore_errors = true } },
      },
    },
  },

  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      -- Define custom highlight groups
      vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#c4a7e7", bold = true })
      vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#9ccfd8" })
      vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#eb6f92", italic = true })

      local dashboard = require "alpha.themes.dashboard"

      local logo = [[
                 /'`\             /|\
               ,' :  `\  ,      /' | `\
              .'  :    `/| /| /'  /'   |
           ._ |   `\   |'|/'//'  |     | ,
           `\`-\    |  |/' |'|   `\    |/|
            /`\_`-,_|_-'_,-'/|     `\,/'/'
           |/~~~~~~\ /'~  /' `\___-~/_,'
                    Y     `~`~\_Y ~~~
                     `\/        |_
        _______       -`,/    \/'
     _/~~    \ ~\       |    /'
   /' ~/~~~~~\|  `~\  _.' _/'\
 /'_/~|    /'~`\   |\  |_ |
|/~_/~~~\/'     `\ | `\| /'\
|/'     `\   /~~~~`\____\'
          `~'\___ _/__,-|
                 ~~'   -|_
                        |
  ]]

      dashboard.section.header.val = vim.split(logo, "\n")
      dashboard.section.header.opts.hl = "AlphaHeader"

      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find File", "<cmd>Telescope find_files no_ignore=true hidden=true<cr>"),
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
      dashboard.opts.layout[1].val = 2

      require("alpha").setup(dashboard.opts)
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = "BufReadPre",
    config = function()
      local lint = require "lint"

      lint.linters_by_ft = {
        fish = { "fish" },
        lua = { "luacheck" },
        python = { "flake8" },
      }

      local function debounce(ms, fn)
        local timer = vim.uv.new_timer()
        return function(...)
          local argv = { ... }
          timer:start(ms, 0, function()
            timer:stop()
            vim.schedule_wrap(fn)(unpack(argv))
          end)
        end
      end

      local function run_lint()
        local ft = vim.bo.filetype
        local names = lint._resolve_linter_by_ft(ft)
        names = vim.list_extend({}, names)

        if #names == 0 then
          vim.list_extend(names, lint.linters_by_ft["_"] or {})
        end

        vim.list_extend(names, lint.linters_by_ft["*"] or {})

        local ctx = { filename = vim.api.nvim_buf_get_name(0) }
        ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")
        names = vim.tbl_filter(function(name)
          local linter = lint.linters[name]
          return linter and not (type(linter) == "table" and linter.condition and not linter.condition(ctx))
        end, names)

        if #names > 0 then
          lint.try_lint(names)
        end
      end

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
        callback = debounce(100, run_lint),
      })
    end,
  },

  { "nvim-tree/nvim-web-devicons", enabled = false },

  {
    "echasnovski/mini.icons",
    lazy = true,
    init = function()
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
    opts = {
      file = {
        [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
        ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
      },
      filetype = {
        dotenv = { glyph = "", hl = "MiniIconsYellow" },
      },
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup {
        cmdline = {
          enabled = true,
          view = "cmdline_popup",
          format = {
            cmdline = { pattern = "^:", icon = "", lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = "🔍 ", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = "🔍 ", lang = "regex" },
          },
        },
        messages = {
          enabled = true,
        },
        popupmenu = {
          enabled = true,
        },
        presets = {
          bottom_search = true,
          command_palette = true,
          long_message_to_split = true,
        },
      }
    end,
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require "notify"
    end,
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
  -- stylua: ignore
  keys = {
    { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
    { "<leader>qS", function() require("persistence").select() end,desc = "Select Session" },
    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
  },
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        build = not vim.loop.os_uname().sysname:match "Windows"
            and "echo 'NOTE: jsregexp is optional'; make install_jsregexp"
          or nil,
        dependencies = {
          {
            "rafamadriz/friendly-snippets",
            config = function()
              require("luasnip.loaders.from_vscode").lazy_load()
              require("luasnip.loaders.from_vscode").lazy_load {
                paths = { vim.fn.stdpath "config" .. "/snippets" },
              }
            end,
          },
        },
        config = function()
          require("luasnip").config.set_config {
            history = true,
            delete_check_events = "TextChanged",
          }

          _G.LazyVim = _G.LazyVim or {}
          LazyVim.cmp = LazyVim.cmp or {}
          LazyVim.cmp.actions = LazyVim.cmp.actions or {}

          LazyVim.cmp.actions.snippet_forward = function()
            if require("luasnip").jumpable(1) then
              vim.schedule(function()
                require("luasnip").jump(1)
              end)
              return true
            end
          end

          LazyVim.cmp.actions.snippet_stop = function()
            if require("luasnip").expand_or_jumpable() then
              require("luasnip").unlink_current()
              return true
            end
          end
        end,
      },

      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
    },
    opts = function()
      local cmp = require "cmp"
      return {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
              require("luasnip").expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
              require("luasnip").jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
      }
    end,
  },

  {
    "gbprod/yanky.nvim",
    event = "BufReadPost",
    opts = {
      highlight = { timer = 150 },
    },
    keys = {
      {
        "<leader>p",
        function()
          local ok, pick = pcall(require, "telescope._extensions.yank_history")
          if ok then
            require("telescope").extensions.yank_history.yank_history {}
          else
            vim.cmd "YankyRingHistory"
          end
        end,
        mode = { "n", "x" },
        desc = "Open Yank History",
      },

      -- Basic yank/paste
      { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank Text" },
      { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put Text After Cursor" },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put Text Before Cursor" },
      { "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put After Selection" },
      { "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put Before Selection" },

      -- Cycle through yank history
      { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle Forward Yank" },
      { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle Backward Yank" },

      -- Indentation-aware put
      { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After (Linewise)" },
      { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before (Linewise)" },
      { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After (Linewise)" },
      { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before (Linewise)" },

      { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put + Shift Right" },
      { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put + Shift Left" },
      { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put Before + Shift Right" },
      { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put Before + Shift Left" },

      -- With filters
      { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put After + Filter" },
      { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put Before + Filter" },
    },
  },

  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    opts = { headerMaxWidth = 80 },
    keys = {
      {
        "<leader>sr",
        function()
          local grug = require "grug-far"
          local ext = vim.bo.buftype == "" and vim.fn.expand "%:e"
          grug.open {
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          }
        end,
        mode = { "n", "v" },
        desc = "Search and Replace",
      },
    },
  },
}
