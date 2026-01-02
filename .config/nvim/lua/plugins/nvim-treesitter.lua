return {
    event = "VeryLazy",
    -- lazy = false,
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = 'nvim-treesitter.configs',
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
    },
}
