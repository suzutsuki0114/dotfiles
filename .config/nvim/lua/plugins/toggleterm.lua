return {
    -- amongst your other plugins
    {
        'akinsho/toggleterm.nvim', version = "*",
        cmd = {
            "ToggleTerm",
            "ToggleTermSendCurrentLine",
            "ToggleTermSendVisualSelection",
            "ToggleTermSendVisualLines",
            "ToggleTermSetAll",
            "ToggleTermToggleAll",
            "TermExec",
            "ToggleTermStart"
        },
        config = function ()
            require('config.plugins.toggleterm')
        end
    },
}
