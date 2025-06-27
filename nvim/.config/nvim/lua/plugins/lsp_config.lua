return{
    "neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        {"antosha417/nvim-lsp-file-operations", config = true},
        "windwp/nvim-autopairs",
    },
    config = function()
        local lspconf = require("lspconfig")
        local cmplsp = require("cmp_nvim_lsp")
        
        local key = vim.keymap
        local opts = {noremap = true, silent = true}
        
        local on_attach = function(client, bufnr)
            key.set("n", "<leader>fd", vim.lsp.buf.definition , {desc = "Go to fuction definition"}, opts)
            -- key.set("n", "<leader>ff", vim.lsp.buf.implementation() end, {desc = "Go to fuction Implementation"}, opts)
            key.set("n", "<leader>rn", vim.lsp.buf.rename , { desc = "Rename Function"}, opts)
            key.set("n", "<leader>rs", ":LspRestart<CR>" , { desc = "Restart LSP"}, opts)
        end

        local capabilities = cmplsp.default_capabilities()

        local signs = { Error = "❌", Warn = "⚠️", Hint = "➕", Info = "ℹ️",}
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
        end
        
        --- Configure lsp servers ---
        ------ Lua -----
        vim.lsp.config('lua_ls', {
            cmd = { "lua-language-server" },
            filetypes = { "lua" },
            root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
            settings = { Lua = { diagnostics = { globals = {"vim"}, }, }, }
        })
        vim.lsp.enable('lua_ls')

        -----C/C++ -----
        vim.lsp.config('clangd', {
            cmd = { "cland" },
            offsetEncoding = { "utf-8", "utf-16" },
            textDocument = {
                completion = {
                    editsNearCursor = true
                }
            },
            filetypes = {"c", "c++"},
        })
        vim.lsp.enable('clangd')

        ----- ASM -----
        vim.lsp.config('asm_lsp', {
            cmd = { "asm-lsp" },
            filetypes = { "asm", "vmasm" },
            root_markers = { ".asm-lsp.toml", ".git" },
        })
        vim.lsp.enable('asm_lsp')

        ----- markup -----
        vim.lsp.config('marksman', {
            cmd = { "marksman", "server" },
            filetypes = { "markdown", "markdown.mdx" },
            root_markers = { ".marksman.toml", ".git" },
        })
        vim.lsp.enable("marksman")

        ----- Odin -----
        vim.lsp.config('ols', {
            cmd = { "ols" },
            filetypes = { "odin" },
        })
        vim.lsp.enable("ols")


        ----- Zig -----
        vim.lsp.config('zls', {
            cmd = { "zls" },
            filetypes = { "zig", "zir" },
            root_markers = { "zls.json", "build.zig", ".git" },
        })
    end,
}
