vim.o.autocomplete = true

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method("textDocumet/completion") then
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
        ----- Auto indent -----
        vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = args.buf,
            callback = function()
                local cursor_pos = vim.api.nvim_win_get_cursor(0) -- {line, col}
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                -- vim.cmd('normal! gg=G')
                vim.api.nvim_win_set_cursor(0, cursor_pos)
            end,
        })
    end,
})

vim.opt.complete:append('o', "t")
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.o.pumheight = 5
vim.o.pumborder = "rounded"
---------- Lua_ls ----------
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "hl" }
            },
            workspace = {
                library = {
                    vim.env.VIMRUNTIME,
                    vim.fn.stdpath("config"),
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
vim.lsp.enable({ "lua_ls" })

---------- c/cpp ----------
vim.lsp.config("clangd", {})
vim.lsp.enable("clangd")
