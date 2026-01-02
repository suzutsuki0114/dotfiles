return {
    "tadaa/vimade",
    -- event = { "BufReadPre" },
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    -- event = { "VeryLazy" },
    opts = {
        recipe = {"default", {animate = false}},
        blocklist = {
            my_rule = {
                win_type = { "popup" }
            }
        },
        fadelevel = 0.5,
    }
}
