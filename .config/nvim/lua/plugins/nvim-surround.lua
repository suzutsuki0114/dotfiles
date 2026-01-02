return {
    "kylechui/nvim-surround",
    -- event = "VeryLazy",
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
}
