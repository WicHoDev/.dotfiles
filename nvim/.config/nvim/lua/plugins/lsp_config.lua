return{
    "neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {
        "saghen/blink.cmp",
        {"antosha417/nvim-lsp-file-operations", config = true},
        "windwp/nvim-autopairs",
        {
            "folke/lazydev.nvim",
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },

    },
    config = function()

        local signs = { Error = "❌", Warn = "⚠️", Hint = "➕", Info = "ℹ️",}
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
        end

        local capabilities = require("blink.cmp").get_lsp_capabilities()

        ----- Config Servers -----
        require('lspconfig').lua_ls.setup{capabilities = capabilities}
        require('lspconfig').clangd.setup{capabilities = capabilities}

        ----- Auto indent -----
        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                vim.api.nvim_create_autocmd('BufWritePre', {
                    buffer = args.buf,
                    callback = function()
                        local cursor_pos = vim.api.nvim_win_get_cursor(0)  -- {line, col}
                        -- vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                        vim.cmd('normal! gg=G')
                        vim.api.nvim_win_set_cursor(0, cursor_pos)
                    end,
                })
            end,
        })


    end,
}
