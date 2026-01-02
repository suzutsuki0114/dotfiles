return {
    "monaqa/dial.nvim",
    -- event = "VeryLazy",
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    config = function()
        local augend = require("dial.augend")
        require("dial.config").augends:register_group{
            -- グループ名を指定しない場合に用いられる被加数
            default = {
                augend.integer.alias.decimal,   -- nonnegative decimal number (0, 1, 2, 3, ...)
                augend.integer.alias.hex,       -- nonnegative hex number  (0x01, 0x1a1f, etc.)
                augend.constant.alias.bool,
                augend.date.alias["%Y/%m/%d"],  -- date (2022/02/19, etc.)
            },
        }

        vim.keymap.set("n", "<C-a>", function()
            require("dial.map").manipulate("increment", "normal")
        end)
        vim.keymap.set("n", "<C-x>", function()
            require("dial.map").manipulate("decrement", "normal")
        end)
        vim.keymap.set("n", "g<C-a>", function()
            require("dial.map").manipulate("increment", "gnormal")
        end)
        vim.keymap.set("n", "g<C-x>", function()
            require("dial.map").manipulate("decrement", "gnormal")
        end)
        vim.keymap.set("v", "<C-a>", function()
            require("dial.map").manipulate("increment", "visual")
        end)
        vim.keymap.set("v", "<C-x>", function()
            require("dial.map").manipulate("decrement", "visual")
        end)
        vim.keymap.set("v", "g<C-a>", function()
            require("dial.map").manipulate("increment", "gvisual")
        end)
        vim.keymap.set("v", "g<C-x>", function()
            require("dial.map").manipulate("decrement", "gvisual")
        end)
    end
}
