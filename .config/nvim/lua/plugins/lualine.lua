return {
    {
        'nvim-lualine/lualine.nvim',
        event = "UIEnter",
        config = function ()
            vim.opt.laststatus = 3

            require("lualine").setup {
                options = {
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' },
                    refresh = {
                        statusline = 33,
                        tabline = 33,
                        winbar = 33,
                    },
                },
                sections = {
                    lualine_b = {
                        {
                            "branch",
                            icon = '',
                        },
                        {
                            "diff",
                            symbols = { added = " ", modified = " ", removed = " " },
                        },
                        {
                            "diagnostics",
                            sources = { "nvim_lsp" },
                            sections = { "error", "warn", "info", "hint" },
                            symbols = { error = ' ', warn = ' ', info = ' ', hint = '' },
                        },
                    },
                    lualine_c = {
                        {
                            "filename",
                            path = 3,
                            symbols = {
                                modified = " ",
                                readonly = "󰏯 ",
                                new = " ",
                            },
                        },
                    },
                },
            }
        end
    },
    {
        {
            'nvim-tree/nvim-web-devicons',
            lazy = true,
        }
    }
}

