return {
    "zbirenbaum/copilot.lua",
    event = "VeryLazy",
    config = function ()
        require("copilot").setup({
            suggestion = { enabled = false },
            panel = { enabled = true },
        })
    end
}
