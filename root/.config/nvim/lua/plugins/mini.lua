require('mini.notify').setup({
    -- Content management
    content = {
        format = nil, -- Uses default format (prepends time)
        sort = nil,   -- Uses default sort (by level, then timestamp)
    },

    -- LSP progress notifications
    lsp_progress = {
        enable = true,
        level = 'INFO',
        duration_last = 1000, -- Show last message for 1 second
    },

    -- Window options
    window = {
        config = {},
        max_width_share = 0.382,
        winblend = 25,
    },
})
