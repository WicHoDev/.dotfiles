return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufreadPre", "BufNewFile"},
    main = "ibl",
    opts = {
        indent = {char = "┊"},
    },
    config = function()
        require("ibl").setup()
        local hooks = require("ibl.hooks")
        local highlight = { "White"}
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
           vim.api.nvim_set_hl(0, "White", {fg = '#706F6b'})
        end)

        require("ibl").setup{indent = {highlight = highlight}}
    end
 }
