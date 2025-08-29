require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clangd", "lua_ls", "ast_grep" }
vim.lsp.enable(servers)
