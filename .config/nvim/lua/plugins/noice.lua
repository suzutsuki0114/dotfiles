return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
        },
    },
    {
        {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            lazy = true,
        },
        {
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
            lazy = true,
        },
    },
}
