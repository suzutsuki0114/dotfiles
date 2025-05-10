return {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    opts = {
        -- add any options here
    },
    config = function ()
        require('config.plugins.Comment')
    end
}
