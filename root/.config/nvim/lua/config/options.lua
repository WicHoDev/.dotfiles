local opt = vim.opt

vim.g.netrw_banner = 0

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.wrap = false
opt.smartindent = true
opt.inccommand = "split"

opt.splitright = true
opt.splitbelow = true

opt.ignorecase = true
opt.smartcase = true
opt.laststatus = 3

opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("$HOME/.config/nvim/.undodir/")
opt.undofile = true

opt.guicursor =
"n-v-c:block,i:ver25," --r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175
opt.scrolloff = 10

opt.colorcolumn = "0"
opt.signcolumn = "yes"
opt.cmdheight = 0
opt.termguicolors = true

opt.clipboard:append("unnamedplus")
-- Clipboard support for Wayland
vim.g.clipboard = {
    name = "wl-clipboard",
    copy = {
        ["+"] = "wl-copy",
        ["*"] = "wl-copy",
    },
    paste = {
        ["+"] = "wl-paste --no-newline",
        ["*"] = "wl-paste --no-newline",
    },
    cache_enabled = true,
}
