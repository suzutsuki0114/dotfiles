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
                    -- separator_style = "slope",
                    separator_style = "thin",
                    numbers = "buffer_id",
                    close_command = "tabclose! %d",
                    right_mouse_command = "tab %d",
                    left_mouse_command = "tab %d",
                    middle_mouse_command = "tabclose %d",
                    hover = {
                        enabled = true,
                        delay = 0,
                        reveal = {'close'}
                    },
                    diagnostics = "nvim_lsp",
                    diagnostics_indicator = function(count, level, diagnostics_dict, context)
                        local icon = level:match("error") and " " or " "
                        return " " .. icon .. count
                    end,

                    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    --     local s = " "
                    --     for e, n in pairs(diagnostics_dict) do
                    --         local sym = e == "error" and " "
                    --         or (e == "warning" and " " or " ")
                    --         s = s .. n .. sym
                    --     end
                    --     return s
                    -- end,

                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "󰥨 File Explorer",
                            text_align = "left",
                            separator = true,
                        },
                    },
                },
            }
        end
    },
    {
        'nvim-tree/nvim-web-devicons',
        lazy = "true"
    }
}
