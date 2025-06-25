return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" }, -- format on save
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
}
