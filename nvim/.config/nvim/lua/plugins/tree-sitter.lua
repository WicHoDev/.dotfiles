local config = function()
    require("nvim-treesitter").setup({
        indent = {  enable = true, },
        --[[
    autotag = {  enable = true, },
    ]]
        ensure_installed = {
            "asm",
            "c",
            "cpp",
            "zig",
            "go",
            "python",
            "lua",

            "vim",
            "vimdoc",
            "cmake",
        },
        auto_install = false,
        highlight = {
            enable = true,
            additiona_vim_regex_highlighting = false,
        },
    })
end

return {
    "OXY2DEV/markview.nvim",
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    config = config
}
