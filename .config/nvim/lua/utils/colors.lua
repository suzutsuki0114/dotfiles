local M = {}

local default_palette = require("onedarkpro.helpers").get_colors()
local palette = {
    bg = default_palette.bg,
    fg = default_palette.fg,
    red = default_palette.red,
    orange = default_palette.orange,
    yellow = default_palette.yellow,
    green = default_palette.green,
    cyan = default_palette.cyan,
    blue = default_palette.blue,
    purple = default_palette.purple,
    white = default_palette.white,
    black = default_palette.black,
    gray = default_palette.gray,
    highlight = default_palette.highlight,
    comment = default_palette.comment,
    none = default_palette.none,
}

local color = require("onedarkpro.helpers")
local generated = {
    -- Lualine colors
    bg_statusline = color.darken(palette.bg, 2.5),
    fg_gutter = color.lighten(palette.bg, 9.6),
    fg_gutter_inactive = palette.fg,

    -- Virtual text
    virtual_text_error = color.lighten(palette.red, 9.3),
    virtual_text_warning = color.lighten(palette.yellow, 9),
    virtual_text_information = color.lighten(palette.blue, 10.2),
    virtual_text_hint = color.lighten(palette.cyan, 10.8),
}

M.palette = palette
M.palette.generated = generated

return M
