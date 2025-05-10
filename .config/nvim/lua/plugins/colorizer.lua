return {
    'norcalli/nvim-colorizer.lua',
    event = { "BufReadPre", "BufNewFile" },
    config = function ()
        require('config.plugins.colorizer')
    end
}
