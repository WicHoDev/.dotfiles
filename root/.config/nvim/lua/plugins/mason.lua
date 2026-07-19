require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        },
    },
})
require("mason-lspconfig").setup({
    ensure_installed = {
        --add lsp langugaes--
        -- "asm_lsp",
        "clangd",
        -- "zls"
        -- "gopls",
        -- "pyright",
        "lua_ls",
        -- "rust-analyser" --not requierd
    },
    automatic_installation = true,
})
