require('hlchunk').setup({
    chunk = {
        enable = true,
        -- style = "#c678dd",
        style = "#56b6c2",
        -- style = "#61afef",
        duration = "0",
        delay = "0",
    },
    indent = {
        enable = true,
    },
    blank = {
        enable = true, -- なんか動かない
        --     chars = {
        --         "․",
        --     },
        --     style = {
        --         { vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"), "" },
        --     },
    },
    line_num = {
        enable = false,
        style = "#c678dd",
    },
})

