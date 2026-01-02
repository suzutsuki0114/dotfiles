return {
    "RRethy/vim-illuminate",
    event = { "CursorMoved", "CursorMovedI" },
    init = function()
        local palette = require("utils.colors").palette
        require("utils.highlight").force_set_highlights("vim-illuminate_hl", {
            IlluminatedWordText = { ctermbg = 238, bg = palette.generated.fg_gutter },
            IlluminatedWordRead = { ctermbg = 238, bg = palette.generated.fg_gutter },
            IlluminatedWordWrite = { ctermbg = 238, bg = palette.generated.fg_gutter },
        })
    end,
    config = function()
        require("illuminate").configure({
            delay = 0,
            filetypes_denylist = {
                'neo-tree',
                'TelescopePrompt',
                'dapui_console',
                'dapui_watches',
                'dapui_stacks',
                'dapui_breakpoints',
                'dapui_scopes',
                'dap-repl',
            },
        })
    end,
}
