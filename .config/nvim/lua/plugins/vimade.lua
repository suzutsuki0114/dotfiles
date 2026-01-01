return {
    "tadaa/vimade",
    -- event = { "BufReadPre" },
    event = { "VeryLazy" },
    opts = {
        recipe = {"default", {animate = false}},
        fadelevel = 0.5,
    }
}
