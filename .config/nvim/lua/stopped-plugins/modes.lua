return {
    "mvllow/modes.nvim",
    -- tag = "v0.2.1",
    -- event = { "BufReadPre" },
    -- event = { "BufReadPre", "BufEnter" },
    event = "VeryLazy",
    config = function()
        local palette = require("onedarkpro.helpers").get_colors()
        require('modes').setup({
            colors = {
                bg = palette.black, -- Optional bg param, defaults to Normal hl group
                copy = palette.yellow,
                delete = palette.red,
                change = palette.red, -- Optional param, defaults to delete
                format = palette.yellow,
                insert = palette.blue,
                replace = palette.red,
                select = palette.yellow, -- Optional param, defaults to visual
                visual = palette.yellow,
            },

            -- Set opacity for cursorline and number background
            line_opacity = 0.15,

            -- Enable cursor highlights
            set_cursor = false,

            -- Enable cursorline initially, and disable cursorline for inactive windows
            -- or ignored filetypes
            set_cursorline = true,

            -- Enable line number highlights to match cursorline
            set_number = false,

            -- Enable sign column highlights to match cursorline
            set_signcolumn = true,

            -- Disable modes highlights for specified filetypes
            -- or enable with prefix "!" if otherwise disabled (please PR common patterns)
            -- Can also be a function fun():boolean that disables modes highlights when true
            ignore = { "NvimTree", "TelescopePrompt", "!minifiles" }
        })
    end
}
