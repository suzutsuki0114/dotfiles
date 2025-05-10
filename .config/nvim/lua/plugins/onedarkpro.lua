return {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000, -- Ensure it loads first
    config = function ()
        require('config.plugins.onedarkpro')
    end
}

