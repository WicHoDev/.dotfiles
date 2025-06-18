-- TODO: re wriete LSP Config from scratch 
-- friday saounds good, just after exams

local config = function()
    local mason = require("mason")
    require("neoconf").setup({})
    local masonlsp = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local lspconfig = require("lspconfig")

    --icons
    --Error = "❌", Warn = "⚠️ ", Hint = "➕", Info = "ℹ️ "
    --Error = "X", Warn = "W", Hint = "+", Info = "I"
    local signs = { Error = "❌", Warn = "⚠️", Hint = "➕", Info = "ℹ️",}
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
    end

    --keybinds
    --[[ 
    local on_attach = function(client, bufnr)
        local opts = {noremap = true, silent = true, buffer = bufnr,}
        --set keybinds
        vim.keymap.set("n", "<leader>fd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    end
 ]]

    mason.setup()
    masonlsp.setup({
        ensure_installed ={

            "efm",  --requiere for lsp
            --------------------------------------------------
            --add lsp langugaes--
            "lua_ls",
            "clangd",
            "ols",
            -- "clang_tidy",
            -- "omnisharp",
        },
        automatic_installation = true,
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    ---lua
    lspconfig.lua_ls.setup({
        -- on_attach = on_attach,
        settings = {
            Lua = {
                runtime = { version = "LuaJIT"},
                diagnostics = { globals = { "vim" }, },
                completion = { callSnippet = "Replace", },
                workspace = { library = vim.api.nvim_get_runtime_file("", true), },
            },
        },
    })
    local luacheck = require("efmls-configs.linters.luacheck")
    local stylua = require("efmls-configs.formatters.stylua")

    --c++
    lspconfig.clangd.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {
            "clangd",
            "--offset-encoding=utf-16",
        },
        settings = {
        },
    })

    local clangdformat = require("efmls-configs.formatters.clang_format")
    local clangtidy = require("efmls-configs.linters.clang_tidy")

    --Python
    lspconfig.pyright.setup({
        -- on_attach = on_attach,
        capabilities = capabilities,
    })
    local pylint = require("efmls-configs.linters.pylint")

    --odin
    lspconfig.ols.setup({
        -- on_attach = on_attach,
        capabilities = capabilities,
    })

    --c#
    --[[ lspconfig.omnisharp.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        omnisharp = {},
        settings = {},
    }) ]]
    --uses same formatter as c++
    -- local sonarlint = require("sonarlint")

    ---------------------------------------------------- clangd fix

    --EFM
    lspconfig.efm.setup({

        filetypes = {
            "lua",
            "c",
            "cpp",
            "py",
            "odin",
            -- "cs",
        },
        init_options = {
            documentFormatting = true,
            documentRangeFormatting = true,
            hover = true,
            documentSymbol = true,
            codeAction = true,
            completion = true,
        },
        settings = {
            languages =
                {
                    -- language = { linters, Formatters },
                    lua = {luacheck, stylua},
                    cpp = {clangtidy,clangdformat }, --,clangdformat
                    python = {pylint},
                    -- cs  = {clangdformat},
                },
        },

    })

    -- format on save??
end


return{
    "neovim/nvim-lspconfig",
    config = config,
    lazy = false,
    dependencies = {
        "windwp/nvim-autopairs",
        "williamboman/mason.nvim",
        "creativenull/efmls-configs-nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
    },

}
