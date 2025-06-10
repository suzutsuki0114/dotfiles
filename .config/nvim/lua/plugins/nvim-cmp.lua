return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
            local has_words_before = function()
                if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
            end
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<S-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                            -- they way you will only jump inside the snippet region
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),

                sources = cmp.config.sources {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "copilot" },
                },

                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol",
                        max_width = 50,
                        symbol_map = {
                            Copilot = "",
                        },
                    })
                },
            })
        end,
    },
    {
        {
            "neovim/nvim-lspconfig",
            event = "VimEnter",
        },
        {
            "hrsh7th/cmp-nvim-lsp",
            event = "InsertEnter",
            -- lazy = true,
        },
        {
            "hrsh7th/cmp-buffer",
            event = "InsertEnter",
            -- lazy = true,
        },
        {
            "hrsh7th/cmp-path",
            event = "InsertEnter",
            -- lazy = true,
        },
        {
            "hrsh7th/cmp-cmdline",
            event = "InsertEnter",
            -- lazy = true,
        },
        {
            "onsails/lspkind-nvim",
            event = "InsertEnter",
            -- lazy = true,
        },
        {
            "hrsh7th/cmp-nvim-lsp-signature-help",
            event = "VeryLazy",
            -- lazy = true,
        },
        {
            "hrsh7th/cmp-nvim-lsp-document-symbol",
            event = "VeryLazy",
            -- lazy = true,
        },
        {
            "L3MON4D3/LuaSnip",
            event = "InsertEnter",
            -- lazy = true,
        }
    },
}

