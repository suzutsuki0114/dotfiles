return {
    "windwp/nvim-ts-autotag",
    -- event = { "BufNewFile", "BufReadPre" },
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    config = function ()
        require("nvim-ts-autotag").setup({})
    end
}
