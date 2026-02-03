return  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    event = "BufReadPre",
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
                -- "asm_lsp",
                "clangd",
                -- "zls"
                -- "gopls",
                "pyright",
                "lua_ls",
                -- "rust-analyser" --not requierd
            },
            automatic_installation = true,
        })
    end
}
