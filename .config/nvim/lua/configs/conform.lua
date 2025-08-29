local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    sh = { "beautysh" },
    bash = { "beautysh" },
    zsh = { "beautysh" },
    python = { "ast-grep" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    toml = { "pyproject-fmt" },
    rust = { "ast-grep" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    cs = { "clang-format" },
    cmake = { "cmakelang" },
    java = { "google-java-format" },
    angular = { "prettier" },
    vue = { "prettier" },
    markdown = { "prettier" },
  },

  format_on_save = {
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}

return options
