return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        -- lazy = false, -- neo-tree will lazily load itself
        cmd = {
            "Neotree",
        },
        ---@module "neo-tree"
        ---@type neotree.Config?
        config = function ()
            require('neo-tree').setup({
                default_source = "filesystem",
                filesystem = {
                    filtered_items = {
                        visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
                        hide_dotfiles = false,
                        hide_gitignored = true,
                    },
                },
            })
        end
    },
    {
        {
            "nvim-lua/plenary.nvim",
            lazy = true,
        },
        {
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            lazy = true,
        },
        {
            "MunifTanjim/nui.nvim",
            lazy = true,
        },
        -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
}
