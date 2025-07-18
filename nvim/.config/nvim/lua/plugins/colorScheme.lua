return {
    ----- transparency -----
    --[[ {
        'tribela/transparent.nvim',
        event = 'VimEnter',
        config = true,
    }, ]]

    ----- THEMES ----
    --[[ {
        "olimorris/onedarkpro.nvim",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "onedark_dark"
        end
    }, ]]
    --[[ {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        -- colorscheme catppuccin,  --"catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha "
        config = function ()
            vim.cmd.colorscheme "catppuccin-mocha"
        end
    }, ]]
    {
        'marko-cerovac/material.nvim',
        lazy = false,
        priority = 1000,
        config = function ()
            vim.g.material_style = "deep ocean"
            vim.cmd.colorscheme "material"
        end
    },

    --[[ {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "gruvbox"
        end,
    }, ]]
}
