return {

    "windwp/nvim-autopairs",
    event = "InsertEnter",  -- Load the plugin only in insert mode
    dependencies = {
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("nvim-autopairs").setup({
            check_ts = true,   -- Enable treesitter integration for better pairing
            ts_config = {},
        })

        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")

        cmp.event:on("config_done", cmp_autopairs.on_confirm_done())
    end,
}
