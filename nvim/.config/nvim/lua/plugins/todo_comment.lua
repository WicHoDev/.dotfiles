return {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        --[[ require('todo-comments').setup {
            search = {
                telescope = {
                    theme = "ivy",
                }
            }
        } ]]
        _G.todo_comments = require("todo-comments")
        -- Add Keymaps Here
        todo_comments.setup()
    end,
}

--[[

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })
 ]]

