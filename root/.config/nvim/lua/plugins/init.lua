----- Theme -----
vim.g.material_style = "deep ocean"
require('material').setup({
    custom_colors = function(color)
        color.editor.cursor = "#FF3131"
        color.syntax.comments = "#50FA7B"
    end,
    lualine_style = "default",
})
vim.cmd 'colorscheme material'

----- Plugins -----
require("plugins.mason")
require("plugins.lsp")
require("plugins.treesitter")
require("plugins.mini")
require("plugins.statusline") --mini.statusline
require("plugins.autopair")
