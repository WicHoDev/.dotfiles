return {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "1.*",
    opts = {
        keymap = { preset = 'default',},
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'normal',
        },
        sources = {
            default = { 'lsp', 'buffer', 'snippets', 'path', },
        },
        signature = { enabled = true },
        -- completion = { documentation = { auto_show = false } },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    }
}
