return {
    'nmac427/guess-indent.nvim',
    -- event = "VeryLazy",
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    config = function() require('guess-indent').setup {} end,
}
