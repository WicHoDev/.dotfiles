return{
    "vimpostor/vim-tpipeline",
    lazy = false,
    config = function()
        vim.g.tpipeline_autoembed = 1
        vim.g.tpipeline_restore = 1
        vim.g.tpipeline_clearstl = 1

        --[[ vim.api.nvim_create_autocmd("InsertLeave", {
            callback = function()
                vim.defer_fn(function()
                    vim.cmd("call tpipeline#update()")
                end, 20)
            end,
        }) ]]
    end
}
