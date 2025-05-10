return {
    -- amongst your other plugins
    {
        'akinsho/toggleterm.nvim', version = "*", config = true,
        cmd = {
            "ToggleTerm",
            "ToggleTermSendCurrentLine",
            "ToggleTermSendVisualSelection",
            "ToggleTermSendVisualLines",
            "ToggleTermSetAll",
            "ToggleTermToggleAll",
        },
    },
}
