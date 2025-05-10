return {
    {
        "williamboman/mason.nvim",
        version = "1.11.0",
        event = "VimEnter",
        config = function ()
            require('config.plugins.mason')
            vim.cmd('LspStart')
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        version = "1.32.0",
        event = "VimEnter",
    },
    {
        "neovim/nvim-lspconfig",
        event = "VimEnter",
    },
}
