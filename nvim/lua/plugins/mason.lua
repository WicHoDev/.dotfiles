return  {
    {   --Mason Installation
        "williamboman/mason.nvim",
        cmd = "Mason",
        event = "BufReadPre",
        config = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜ ",
                    package_uninstalled = "✗",
                }
            }
        }
    },

    {   --Mason-lspconfig instalation
        "williamboman/mason-lspconfig.nvim", 
        event = "BufReadPre",        
        dependencies = "williamboman/mason.nvim",
    },

}
