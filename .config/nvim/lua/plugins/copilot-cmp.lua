return {
    "zbirenbaum/copilot-cmp",
    event = { "VimEnter" },
    config = function ()
        require("copilot_cmp").setup()
    end,
    dependencies = {
        "hrsh7th/nvim-cmp",
        "zbirenbaum/copilot.lua",
    },
}
