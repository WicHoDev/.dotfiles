--[[ -- Global variable to store the last message shown
local last_message = ""

-- Custom function to prevent duplicate notifications
local function notify_once(msg, level, opts)
  -- Only show the message if it differs from the last one
  if msg ~= last_message then
    vim.notify(msg, level, opts)
    last_message = msg  -- Update the last message to the current one
  end
end ]]

-- Set the custom notify function
-- vim.notify = notify_once


return{
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
    -- add any options here
    },
    dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    --this works fot notifications about the comands, can disable it or modify it
    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup({
                border_colour = "#0096e1",
                background_colour = "#000000",
                render = "minimal",
                stages = "fade",
                timeout = 700,
                icons = {
                    -- info = "",    -- Info icon
                    warn = "",    -- Warning icon
                    error = "",   -- Error icon
                    -- debug = "",   -- Debug icon
                    -- trace = "🔍",   -- Trace icon
                },
            })
        end
    },
    },
    -- Disable conflicting notification messages (if using noice.nvim)
    config = function()
        require("noice").setup({
            cmdline = {
                enabled = true,
                view = "cmdline",
            },
            messages = {
                enabled = true,  -- Disable general message notifications
                notify = require("notify")
            },
            lsp = {
                progress = { enabled = true },
                signature = { enabled = true },
                hover = { enabled = true },
            }
        })

    end
}
