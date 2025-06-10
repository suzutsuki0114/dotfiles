return {
    {
        'nvimdev/dashboard-nvim',
        lazy = false,
        config = function()
            local logo = ""

            logo = string.rep("\n", 8) .. logo .. "\n\n"
            -- local logo = require 'ascii'.art.text.neovim.sharp
            -- logo = string.rep("\n", 8) .. logo .. "\n\n"
            require('dashboard').setup {
                -- config = {
                --     header = vim.split(logo, "\n"),
                -- },
                theme = "doom",
                hide = {
                    -- this is taken care of by lualine
                    -- enabling this messes up the actual laststatus setting after loading a file
                    statusline = false,
                },
                config = {
                    header = vim.split(logo, "\n"),
                    -- stylua: ignore
                    center = {
                        { action = 'Telescope frecency',                             desc = " Find File",       icon = " ", key = "f" },
                        { action = "ene",                                            desc = " New File",        icon = " ", key = "n" },
                        -- { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
                        { action = 'Telescope live_grep',                            desc = " Find Text",       icon = " ", key = "g" },
                        -- { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
                        -- { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
                        -- { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
                        { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
                        { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
                    },
                    footer = function()
                        local stats = require("lazy").stats()
                        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                        return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
                    end,
                }
            }
        end,
    },
    {
        {
            'nvim-tree/nvim-web-devicons',
            lazy = true,
        },
    },
}
