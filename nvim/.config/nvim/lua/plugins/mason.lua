return  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    dependencies = {
        "mason-org/mason-lspconfig.nvim", 
    },
    config = function()
        local mason = require("mason")
        local masonlsp = require("mason-lspconfig")
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜ ",
                    package_uninstalled = "✗",
                },
            },
        })
        masonlsp.setup({
            ensure_installed = {
                --add lsp langugaes--
                "lua_ls",
                "clangd",
                "asm-lsp",
                "ols",
                "marksman",
            },
            automatic_installation = true,
        })
    end
}
