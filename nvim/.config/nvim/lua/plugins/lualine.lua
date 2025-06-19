local config = function()
  local theme = require('lualine.themes.onedark')
  -- theme.normal.c.bg = nil

  require("lualine").setup{
    options = {
      theme = theme,
      globalstatus = true,
    },

    sections = {
      lualine_a = {
        {
          "buffers",
          use_mode_colors = true,
        },
      },

      lualine_b = {},
      lualine_c = {},
      lualine_x = {
        {"filesize",},
        {
          "filetype",
          icon_only = false,
--[[           buffers_color = {
            -- Same values as the general color option can be used here.
            active = 'lualine_{section}_normal',     -- Color for active buffer.
            inactive = 'lualine_{section}_inactive', -- Color for inactive buffer.
          }, ]]
        },
      },
      lualine_y = {
        {"location",},
        {"branch"},
      },
      lualine_z = {
        {"mode",},
      },

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
