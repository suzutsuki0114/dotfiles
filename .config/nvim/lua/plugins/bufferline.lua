return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        event = "UIEnter",
        config = function ()
            vim.opt.termguicolors = true
            require("bufferline").setup{
                options = {
                    mode = "tabs",
                    close_command = "tabclose! %d",
                    right_mouse_command = "tab %d",
                    left_mouse_command = "tab %d",
                    middle_mouse_command = "tabclose %d",
                    diagnostics = "nvim_lsp",
                    diagnostics_indicator = function(count, level, diagnostics_dict, context)
                        local icon = level:match("error") and " " or " "
                        return " " .. icon .. count
                    end,
                },
            }
        end
    },
    {
        'nvim-tree/nvim-web-devicons',
        lazy = "true"
    }
}
