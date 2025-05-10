return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter"
    },
    {
        {
            "neovim/nvim-lspconfig",
            event = "VimEnter",
        },
        {
            "hrsh7th/cmp-nvim-lsp",
            lazy = true,
        },
        {
            "hrsh7th/cmp-buffer",
            lazy = true,
        },
        {
            "hrsh7th/cmp-path",
            lazy = true,
        },
        {
            "hrsh7th/cmp-cmdline",
            lazy = true,
        },
        {
            "onsails/lspkind-nvim",
            lazy = true,
        },
        {
            "hrsh7th/cmp-nvim-lsp-signature-help",
            lazy = true,
        },
        {
            "hrsh7th/cmp-nvim-lsp-document-symbol",
            lazy = true,
        },
    },
}

