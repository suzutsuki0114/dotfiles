return {
    'norcalli/nvim-colorizer.lua',
    -- event = { "BufReadPre", "BufNewFile" },
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    config = function ()
        -- require 'colorizer'.setup {
        --     names = false
        -- }
        require("colorizer").setup({
            '*',
            markdown = {
                names = false
            }
        })
    end
}
