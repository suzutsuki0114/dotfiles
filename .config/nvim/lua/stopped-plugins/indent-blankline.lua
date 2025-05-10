return {
    "lukas-reineke/indent-blankline.nvim",
    -- event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    config = function ()
        require("ibl").setup({
            indent = {
                char = "│",
                tab_char = ".",
            },
            scope = {
                enabled = false,
            }
        })
    end
}
