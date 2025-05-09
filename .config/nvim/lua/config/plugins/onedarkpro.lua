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
