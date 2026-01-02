return {
    "OXY2DEV/markview.nvim",
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    -- lazy = false,
    config = function()
        require("markview").setup {
            experimental = {
                check_rtp_message = false,
            },
        }
    end

    -- For blink.cmp's completion
    -- source
    -- dependencies = {
    --     "saghen/blink.cmp"
    -- },
};
