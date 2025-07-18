-- plugins/ elescope.lua
return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    -- lazy = true,
    -- cmd = { "Telescope" },
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    keys = {
        { "<leader>k",  function() require("telescope.builtin").find_files() end, desc = "Find Files" },
        { "<leader>fh", function() require("telescope.builtin").help_tags() end,  desc = "Help Docs" },
        { "<leader>fg", function() require("telescope.builtin").git_files() end,  desc = "Git Files" },
        { "<leader>fG", function() require("telescope.builtin").live_grep() end,  desc = "Live Grep" },
        { "<leader>j",  function() require("telescope.builtin").buffers() end,    desc = "Buffer List" },

        { "<leader>en", function()
            require("telescope.builtin").find_files {
                cwd = vim.fn.stdpath("config")
            }
        end, desc = "Open Nvim Config Directory"},
    },
    config = function()
        require('telescope').setup {
            pickers = {
                find_files = {
                    theme = "ivy",
                },
                help_tags = {
                    initial_mode = "normal",
                    theme = "ivy",
                },
                live_grep = {
                    theme = "ivy",
                },
                buffers = {
                    initial_mode = "normal",
                    theme = "ivy",
                    mappings = {
                        n = {
                            ["C-d"] = require("telescope.actions").delete_buffer,
                        }
                    },
                },
                TodoTelescope = {
                    initial_mode = "normal",
                    theme = "ivy",
                },
            },
            extensions = {
                fzf = {}
            },
        }
        require('telescope').load_extension('fzf')
    end
}
