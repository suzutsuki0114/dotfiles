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
                default_component_configs = {
                    modified = {
                        symbol = "●",
                        highlight = "NeoTreeModified",
                    },
                    git_status = {
                        symbols = {
                            -- Change type
                            added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                            modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
                            deleted = "", -- this can only be used in the git_status source
                            renamed = "", -- this can only be used in the git_status source
                            -- Status type
                            untracked = "",
                            ignored = "",
                            unstaged = "󰄱",
                            staged = "",
                            conflict = "",
                        },
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
