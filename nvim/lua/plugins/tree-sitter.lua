local config = function()
  require("nvim-treesitter.configs").setup({
    indent = {
      enable = true,
    },
--[[     autotag = {
      enable = true,
    },
  ]]
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query";

      "cmake",
      "cpp",
      "c_sharp",
      "odin",
    },
    auto_install = true,
    highlight = {
      enable = true,
      additiona_vim_regex_highlighting = true,
    },
  })
end

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = config
}
