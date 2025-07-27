return {
    'stevearc/overseer.nvim',
    keys = {
        { "<space>r", "<CMD>OverseerRun<CR>" },
        { "<space>R", "<CMD>OverseerToggle<CR>" },
    },
    config = function()
        require('overseer').setup({
            templates = {
                "builtin",
                "c.gcc-debug-build",
                "cpp.gpp-debug-build",
            },
        })
    end,
}
