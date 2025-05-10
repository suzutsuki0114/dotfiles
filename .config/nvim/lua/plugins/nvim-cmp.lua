return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function ()
            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "nvim_lsp_signature_help" },
                }, {
                        { name = "copilot" },
                    }, {
                        { name = "buffer" },
                    }, {
                        { name = "path" },
                    }),
                formatting = {
                    format = require("lspkind").cmp_format({
                        mode = "symbol",
                        maxwidth = 50,
                        ellipsis_char = "...",
                        preset = "codicons",
                        symbol_map = { Copilot = "" },
                    }),
                },
            })
        end
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

