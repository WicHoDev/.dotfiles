return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,      --false     :defoult
    opts = {
        view = {
            -- hide_root_folder = true,
        },
        filters = {
            dotfiles = false,
        },
        actions = {
            open_file = {
                quit_on_open = true,
                resize_window = true,
            },
        },

    }

}

