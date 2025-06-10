return {
    {
        'goolord/alpha-nvim',
        event = "VimEnter",
        config = function ()
            -- local stats = require("lazy").stats()
            -- local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            -- local load_info = "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
            local version = vim.version()
            local version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
            -- local footer = version_info .. load_info
            local footer = version_info

            local alpha = require'alpha'
            local dashboard = require'alpha.themes.dashboard'
            dashboard.section.header.val = require('ascii').art.text.neovim.sharp
            dashboard.section.buttons.val = {
                dashboard.button( "n", "  New File" , ":ene<CR>"),
                dashboard.button( "f f", "󰱼  Find File" , ":Telescope frecency<CR>"),
                dashboard.button( "f g", "󱎸  Find Text" , ":Telescope live_grep<CR>"),
                dashboard.button( "f o", "  Resently Opened Files" , ":Telescope oldfiles<CR>"),
                dashboard.button( "f k", "󰌌  Keymaps" , ":Telescope keymaps<CR>"),
                dashboard.button( "f m", "󰡯  Man Pages" , ":Telescope man_pages<CR>"),
                dashboard.button( "SPC l", "󰒲  Lazy" , ":Lazy<CR>"),
                dashboard.button( "SPC m", "  Mason" , ":Mason<CR>"),
                dashboard.button( "SPC q", "  Quit" , ":qa<CR>"),
            }
            -- local handle = io.popen('fortune')
            -- local fortune = handle:read("*a")
            -- handle:close()
            -- dashboard.section.footer.val = fortune
            dashboard.section.footer.val = footer

            dashboard.config.opts.noautocmd = true

            alpha.setup(dashboard.config)
        end,
    },
    {
        'nvim-lua/plenary.nvim',
        lazy = true,
    },
    {
        "MaximilianLloyd/ascii.nvim",
        lazy = true,
    },
    {
        "MunifTanjim/nui.nvim",
        lazy = true
    }
}
