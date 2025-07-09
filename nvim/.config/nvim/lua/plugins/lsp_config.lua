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
        ------ EFM -----
        vim.lsp.config('efm',{
            cmd = { "efm-langserver" },
            filetypes = { 'python','cpp','lua','ino', 'arduino' },
            root_markers = { ".git" },
        })
        vim.lsp.enable('efm')
        ------ Lua -----
        vim.lsp.config('lua_ls', {
            cmd = { "lua-language-server" },
            filetypes = { "lua" },
            root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
            settings = { Lua = { diagnostics = { globals = {"vim"}, }, }, }
        })
        vim.lsp.enable('lua_ls')

        ----- ASM -----
        vim.lsp.config('asm_lsp', {
            cmd = { "asm-lsp" },
            filetypes = { "asm", "vmasm" },
            root_markers = { ".asm-lsp.toml", ".git" },
        })
        vim.lsp.enable('asm_lsp')

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
        ----- Arduino -----
        vim.lsp.config('arduino_language_server', {
            filetypes = { "arduino" },
            cmd =  { "arduino-language-server" },
        })
        vim.lsp.enable('arduino_language_server')

        ----- Zig -----
        vim.lsp.config('zls', {
            cmd = { "zls" },
            filetypes = { "zig", "zir" },
            root_markers = { "zls.json", "build.zig", ".git" },
            on_attach = on_attach
        })

        ----- Go -----
        local mod_cache = nil

        ---@param fname string
        ---@return string?
        local function get_root(fname)
            if mod_cache and fname:sub(1, #mod_cache) == mod_cache then
                local clients = vim.lsp.get_clients { name = 'gopls' }
                if #clients > 0 then
                    return clients[#clients].config.root_dir
                end
            end
            return vim.fs.root(fname, 'go.work') or vim.fs.root(fname, 'go.mod') or vim.fs.root(fname, '.git')
        end

        vim.lsp.config('gopls', {
            cmd = { 'gopls' },
            filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
            root_dir = function(bufnr, on_dir)
                local fname = vim.api.nvim_buf_get_name(bufnr)
                -- see: https://github.com/neovim/nvim-lspconfig/issues/804
                if mod_cache then
                    on_dir(get_root(fname))
                    return
                end
                local cmd = { 'go', 'env', 'GOMODCACHE' }
                vim.system(cmd, { text = true }, function(output)
                    if output.code == 0 then
                        if output.stdout then
                            mod_cache = vim.trim(output.stdout)
                        end
                        on_dir(get_root(fname))
                    else
                        vim.schedule(function()
                            vim.notify(('[gopls] cmd failed with code %d: %s\n%s'):format(output.code, cmd, output.stderr))
                        end)
                    end
                end)
            end,
        })
        vim.lsp.enable('gopls')
        ----- python -----

        ----- markup -----
        vim.lsp.config('marksman', {
            cmd = { "marksman", "server" },
            filetypes = { "markdown", "markdown.mdx" },
            root_markers = { ".marksman.toml", ".git" },
        })
        vim.lsp.enable("marksman")
    end,
}
