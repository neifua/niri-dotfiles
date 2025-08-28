require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "clangd", "lua_ls" }
vim.lsp.enable(servers)
