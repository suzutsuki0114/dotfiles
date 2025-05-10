return {
    {
        'nvim-lualine/lualine.nvim',
        event = "UIEnter",
        config = function ()
            require('config.plugins.lualine')
        end
    },
    {
        {
            'nvim-tree/nvim-web-devicons',
            lazy = true,
        }
    }
}

