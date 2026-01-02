return {
    "b0o/incline.nvim",
    event = { "VeryLazy" },
    opts = function()
        local devicons = require("nvim-web-devicons")
        local palette = require("utils.colors").palette

        -- local fg_active = palette.text
        -- local fg_active = palette.purple
        local mode_color = function()
            local Mode = {}

            -- stylua: ignore
            Mode.map = {
                ['n']      = 'NORMAL',
                ['no']     = 'O-PENDING',
                ['nov']    = 'O-PENDING',
                ['noV']    = 'O-PENDING',
                ['no\22'] = 'O-PENDING',
                ['niI']    = 'NORMAL',
                ['niR']    = 'NORMAL',
                ['niV']    = 'NORMAL',
                ['nt']     = 'NORMAL',
                ['ntT']    = 'NORMAL',
                ['v']      = 'VISUAL',
                ['vs']     = 'VISUAL',
                ['V']      = 'V-LINE',
                ['Vs']     = 'V-LINE',
                ['\22']   = 'V-BLOCK',
                ['\22s']  = 'V-BLOCK',
                ['s']      = 'SELECT',
                ['S']      = 'S-LINE',
                ['\19']   = 'S-BLOCK',
                ['i']      = 'INSERT',
                ['ic']     = 'INSERT',
                ['ix']     = 'INSERT',
                ['R']      = 'REPLACE',
                ['Rc']     = 'REPLACE',
                ['Rx']     = 'REPLACE',
                ['Rv']     = 'V-REPLACE',
                ['Rvc']    = 'V-REPLACE',
                ['Rvx']    = 'V-REPLACE',
                ['c']      = 'COMMAND',
                ['cv']     = 'EX',
                ['ce']     = 'EX',
                ['r']      = 'REPLACE',
                ['rm']     = 'MORE',
                ['r?']     = 'CONFIRM',
                ['!']      = 'SHELL',
                ['t']      = 'TERMINAL',
            }

            local mode_code = vim.api.nvim_get_mode().mode
            if Mode.map[mode_code] == nil then
                return palette.green
            end

            if Mode.map[mode_code] == "NORMAL" then
                return palette.green
            elseif Mode.map[mode_code] == "INSERT" then
                return palette.blue
            elseif Mode.map[mode_code] == "VISUAL" or Mode.map[mode_code] == "V-LINE" or Mode.map[mode_code] == "V-BLOCK" then
                return palette.yellow
            elseif Mode.map[mode_code] == "REPLACE" or Mode.map[mode_code] == "V-REPLACE" then
                return palette.red
            elseif Mode.map[mode_code] == "COMMAND" or Mode.map[mode_code] == "EX" then
                return palette.purple
            else
                return palette.green
            end
        end
        local fg_active = mode_color()
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
            fg_active = mode_color()
            local filename, dirname = get_display_filename_and_dirname(props.buf)

            local ft_icon, ft_color = devicons.get_icon_color(filename)

            local isReadonly = vim.bo[props.buf].readonly

            return {
                { get_diagnostic_label(props) },
                {
                    (ft_icon and ft_icon .. " " or ""),
                    guifg = props.focused and ft_color or fg_inactive,
                },
                {
                    (isReadonly and " 󰏯" or ""),
                    guifg = props.focused and palette.red or fg_inactive,
                },
                {
                    dirname and dirname .. "/" or "",
                    guifg = fg_inactive,
                },
                {
                    filename,
                    guifg = props.focused and fg_active or fg_inactive,
                    gui = props.focused and "bold" or "",
                },
                {
                    vim.bo[props.buf].modified and " ●" or "",
                    guifg = props.focused and palette.green or fg_inactive,
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
