return {
    "windwp/nvim-ts-autotag",
    event = { "BufNewFile", "BufReadPre" },
    config = function ()
        require('config.plugins.nvim-ts-autotag')
    end
}
