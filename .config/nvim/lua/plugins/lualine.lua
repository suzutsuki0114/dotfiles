return {
    {
        'nvim-lualine/lualine.nvim',
        event = "UIEnter",
        config = function ()
            vim.opt.laststatus = 3

            require("lualine").setup {
                options = {
                    section_separators = { left = '', right = '' },
                    -- component_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' },
                    refresh = {
                        statusline = 33,
                        tabline = 33,
                        winbar = 33,
                    },
                },
                sections = {
                    lualine_a = {
                        {
                            "mode",
                            -- icons_enabled = true,
                            -- icon = "",
                        },
                    },
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
                            sources = { "nvim_diagnostic" },
                            sections = { "error", "warn", "info", "hint" },
                            symbols = { error = ' ', warn = ' ', info = ' ', hint = '󰌵' },
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
                    lualine_x = {
                        {
                            "encoding",
                            -- icon = "",
                        },
                        {
                            "fileformat",
                            symbols = {
                                unix = '',
                                dos = '',
                                mac = '',
                            },
                        },
                        {
                            "filetype",
                            colored = true,
                            icon_only = false,
                        },
                    },
                    lualine_y = {
                        {
                            "lsp_status",
                        }
                    },
                    lualine_z = {
                        {
                            "datetime",
                                  -- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
                            style = "%m/%d %H:%M:%S",
                        }
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

