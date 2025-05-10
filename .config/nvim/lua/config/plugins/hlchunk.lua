require('hlchunk').setup({
    chunk = {
        enable = true,
        use_treesitter = true,
        -- style = "#c678dd",
        style = "#56b6c2",
        -- style = "#61afef",
        duration = "0",
        delay = "0",
    },
    indent = {
        enable = true,
        use_treesitter = true,
    },
    blank = {
        enable = true,
        chars = {
            "․...",
        },
    },
    line_num = {
        enable = true,
        use_treesitter = true,
        style = "#c678dd",
    },
})

