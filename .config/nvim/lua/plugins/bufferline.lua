return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        event = "UIEnter",
        config = function ()
            require('config.plugins.bufferline')
        end
    },
    {
        'nvim-tree/nvim-web-devicons',
        lazy = "true"
    }
}
