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
        },
        lazy = true,

        config = function ()
            require("toggleterm").setup{}

            local Terminal = require("toggleterm.terminal").Terminal
            local lazygit = Terminal:new({
                cmd = "lazygit",
                direction = "float",
                hidden = true
            })
            local lazydocker = Terminal:new({
                cmd = "lazydocker",
                direction = "float",
                hidden = true
            })

            function _lazygit_toggle()
                lazygit:toggle()
            end
            function _lazydocker_toggle()
                lazydocker:toggle()
            end
        end
    },
}
