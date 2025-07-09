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
                "asm_lsp",
                "clangd",
                "arduino_language_server",
                --zig
                "gopls",
                --pythn
                "lua_ls",
            },
            automatic_installation = true,
        })
    end
}
