return {
    -- "olimorris/onedarkpro.nvim",
    "suzutsuki0114/onedarkpro.nvim",
    event = "UIEnter",
    -- lazy = false,
    priority = 1000, -- Ensure it loads first
    config = function ()
        require("onedarkpro").setup({
            highlights = {
                TermCursor = { bg = "#D2CEC4" },
                Comment = { fg = "#5C6370", italic = true },
            },
            styles = {
                comments = "italic",
                functions = "bold",
                variables = "italic",
            },
            options = {
                cursorline = true,
            },
        })

        vim.cmd("colorscheme onedark")
        vim.cmd('highlight TermCursor guifg=#282C34')
    end
}

