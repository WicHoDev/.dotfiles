local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"	--chack if lazy is install
if not vim.loop.fs_stat(lazypath) then				--if not
    vim.fn.system({						--go to git and clone the repo
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)					--

require("config.globals")		--get the changes of key shortcuts
require("config.options")		--get the "opt" options from options .lua
require("config.keymaps")   --Get new keymaps


local opts = {
	  defaults = {
        lazy = true,		--enable lazy
    },
	  install = {
        colorscheme = { "onedarkpro" },	--install color scheme
    },
    rtp = {
        disabled_plugins = {	--didable defoult plugins
            "gzip",
            "matchit",
            "matchparen",
            "netrw",
            "netrwPlugin",
            "tarPlugin",
            "tohtml",
            "tutor",
            "zipPlugin",
        }
    },
    change_detection = {
        notify = true, -- get a notification when changes are found
    },
}

require("lazy").setup({{import = "plugins"}}, opts)		--all plugg ins are in folder "plugins"
