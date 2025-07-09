local config = function()
    -- local theme = require('lualine.themes.onedark')
    local theme = require('lualine.themes.material')
    -- theme.normal.c.bg = nil

    require("lualine").setup{
        options = {
            theme = theme,
            section_separators = '',
            component_separators = '',
            -- icons_enabled = true,
            globalstatus = false,
        },

        sections = {
            lualine_a = {
                {
                    "filename",
                    use_mode_colors = true,
                },
            },

            lualine_b = { 'diff', },
            lualine_c = {},
            lualine_x = {
                {"location"},
                {
                    "filetype",
                    icon_only = true,
                    --[[           buffers_color = {
                        -- Same values as the general color option can be used here.
                        active = 'lualine_{section}_normal',     -- Color for active buffer.
                        inactive = 'lualine_{section}_inactive', -- Color for inactive buffer.
                    }, ]]
                },
            },
            lualine_y = { "branch", },
            lualine_z = {"filesize"},

        },

        --[[ inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        }, ]]

    }
end

return{
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = config,
}
