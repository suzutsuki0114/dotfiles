return {
    "windwp/nvim-ts-autotag",
    event = { "BufNewFile", "BufReadPre" },
    config = function ()
        require("nvim-ts-autotag").setup({})
    end
}
