return{
    "lervag/vimtex",
    lazy = false,          -- IMPORTANT
    init = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_compiler_method = "latexmk"
        vim.g.vimtex_compiler_latexmk = {
            continuous = 1,   -- auto compile on save
        }
    end
}
