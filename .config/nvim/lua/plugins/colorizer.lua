return {
    'norcalli/nvim-colorizer.lua',
    event = { "BufReadPre", "BufNewFile" },
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
