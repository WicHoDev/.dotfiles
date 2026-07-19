require("nvim-treesitter").setup({
    indent = { enable = true, },
    ensure_installed = {
        -- "asm",
        "c",
        "cpp",
        "zig",
        -- "go",
        "python",
        "lua",

        "vim",
        "vimdoc",
        "cmake",
    },
    auto_install = true,
    highlight = {
        enable = true,
        additiona_vim_regex_highlighting = false,
    },
})
