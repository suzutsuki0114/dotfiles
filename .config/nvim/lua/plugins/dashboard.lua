return {
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
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
