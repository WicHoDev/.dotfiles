-- plugins/ elescope.lua:
return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    -- lazy = true,
    -- cmd = { "Telescope" },
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
        { "<leader>k", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
        { "<leader>fg", function() require("telescope.builtin").git_files() end, desc = "Find Files" },
        { "<leader>fG", function() require("telescope.builtin").live_grep() end, desc = "Find Files" },
        { "<leader>j", function() require("telescope.builtin").buffers() end, desc = "Find Files" },
    },
    config =function ()
        require('telescope').setup {
            pickers = {
                find_files = {
                    theme = "ivy",
                },
                live_grep = {
                    theme = "ivy",
                },
                buffers = {
                    theme = "ivy",
                },
                TodoTelescope = {
                    theme = "ivy",
                },
            }
        }
        require('telescope').load_extension('fzf')
    end
}
