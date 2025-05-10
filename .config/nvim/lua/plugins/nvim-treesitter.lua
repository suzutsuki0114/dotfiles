return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = 'nvim-treesitter.configs',
    event = "UIEnter",
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
    },
}
