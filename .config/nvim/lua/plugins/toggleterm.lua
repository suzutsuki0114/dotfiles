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
            require("toggleterm").setup{}

            local Terminal = require("toggleterm.terminal").Terminal
            local lazygit = Terminal:new({
                cmd = "lazygit",
                direction = "float",
                hidden = true
            })

            function _lazygit_toggle()
                lazygit:toggle()
            end
        end
    },
}
