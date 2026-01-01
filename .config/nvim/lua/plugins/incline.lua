return {
    "b0o/incline.nvim",
    event = { "VeryLazy" },
    opts = function()
        local devicons = require("nvim-web-devicons")
        local palette = require("onedarkpro.helpers").get_colors()

        -- local fg_active = palette.text
        local fg_active = palette.purple
        local fg_inactive = palette.comment
        local icons = { error = " ", warn = " ", hint = "󰌵 ", info = " " }

        --- @param props { buf: number, win: number, focused: boolean }
        local function get_diagnostic_label(props)
            local label = {}

            for severity, icon in pairs(icons) do
                local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
                if n > 0 then
                    table.insert(label, {
                        icon .. n .. " ",
                        group = props.focused and ("DiagnosticSign" .. severity) or "NonText",
                    })
                end
            end
            if #label > 0 then
                table.insert(label, { "┊ ", guifg = fg_inactive })
            end
            return label
        end

        local get_display_filename_and_dirname = function(propsbuf)
            ---@param fullpath string
            ---@return string, string|nil
            local function _get_display_filename_and_dirname(fullpath)
                local filepath = vim.fn.fnamemodify(fullpath, ":.")
                local filename = vim.fn.fnamemodify(filepath, ":t")

                if filename == "" then
                    return "[No Name]", nil
                end

                local dirpath = filepath
                local display_dir = nil

                for _ = 1, 3 do
                    dirpath = vim.fs.dirname(dirpath)
                    local dirname = vim.fs.basename(dirpath)
                    if dirname == "." then
                        break
                    end
                    display_dir = dirname .. (display_dir and "/" .. display_dir or "")
                end

                return filename, display_dir
            end

            ---@type table<string, { filename: string, dirname: string | nil}>
            local cache = {}

            ---@param buf number
            ---@return string, string|nil
            local function get_display_filename_and_dirname(buf)
                local fullpath = vim.api.nvim_buf_get_name(buf)
                if cache[fullpath] then
                    return cache[fullpath].filename, cache[fullpath].dirname
                end

                local filename, dirname = _get_display_filename_and_dirname(fullpath)
                cache[fullpath] = { filename = filename, dirname = dirname }
                return filename, dirname
            end

            return get_display_filename_and_dirname(propsbuf)
        end

        -- based on https://github.com/b0o/incline.nvim/discussions/32
        --- @param props { buf: number, win: number, focused: boolean }
        local function render(props)
            local filename, dirname = get_display_filename_and_dirname(props.buf)

            local ft_icon, ft_color = devicons.get_icon_color(filename)

            local hasError = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity["ERROR"] }) > 0
            local isReadonly = vim.bo[props.buf].readonly

            local fg_filename_active = hasError and palette.red or (isReadonly and palette.overlay0 or fg_active)
            local fg_filename = props.focused and fg_filename_active or fg_inactive

            return {
                { get_diagnostic_label(props) },
                {
                    (ft_icon and ft_icon .. " " or ""),
                    guifg = props.focused and ft_color or fg_inactive,
                },
                {
                    (isReadonly and " 󰏯" or ""),
                    guifg = fg_filename,
                },
                {
                    dirname and dirname .. "/" or "",
                    guifg = fg_inactive,
                },
                {
                    filename,
                    guifg = fg_filename,
                    gui = props.focused and "bold" or "",
                },
                {
                    vim.bo[props.buf].modified and " ●" or "",
                    guifg = props.focused and palette.peach or fg_inactive,
                },
            }
        end

        return {
            highlight = {
                groups = {
                    InclineNormal = { guibg = palette.black, guifg = fg_active },
                    InclineNormalNC = { guibg = "none", guifg = fg_inactive },
                },
            },
            window = {
                options = {
                    winblend = 0,
                },
                placement = {
                    horizontal = "right",
                    vertical = "bottom",
                },
                margin = { horizontal = 0, vertical = 0 },
                padding = 2,
            },
            render = render,
        }
    end,
}
