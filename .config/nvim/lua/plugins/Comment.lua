return {
    'numToStr/Comment.nvim',
    -- event = "VeryLazy",
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    opts = {
        -- add any options here
    },
    config = function ()
        require('Comment').setup()
    end
}
