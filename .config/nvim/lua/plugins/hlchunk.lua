return {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function ()
        require('config.plugins.hlchunk')
    end
}
