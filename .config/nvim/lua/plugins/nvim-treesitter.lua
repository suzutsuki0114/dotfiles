return {
    -- {
    --     "nvim-treesitter/nvim-treesitter",
    --     branch = "master",
    --     event = "VeryLazy",
    --     -- lazy = false,
    --     build = ":TSUpdate",
    --     main = 'nvim-treesitter.configs',
    --     opts = {
    --         highlight = { enable = true },
    --         indent = { enable = true },
    --     },
    -- },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        event = "VeryLazy",
        -- lazy = false,
        build = ":TSUpdate",
        config = function()
            vim.api.nvim_create_autocmd('FileType', {
                -- pattern = { '<filetype>' },
                pattern = { 'ada', 'agda', 'angular', 'apex', 'arduino', 'asm', 'astro', 'authzed', 'awk', 'bash', 'bass', 'beancount', 'bibtex', 'bicep', 'bitbake', 'blade', 'blueprint', 'bp', 'brightscript', 'caddy', 'cairo', 'capnp', 'chatito', 'circom', 'clojure', 'cmake', 'comment', 'commonlisp', 'cooklang', 'corn', 'cpon', 'cpp', 'c_sharp', 'c', 'css', 'csv', 'cuda', 'cue', 'cylc', 'dart', 'desktop', 'devicetree', 'dhall', 'diff', 'disassembly', 'djot', 'dockerfile', 'dot', 'doxygen', 'd', 'dtd', 'earthfile', 'ebnf', 'editorconfig', 'eds', 'eex', 'elixir', 'elm', 'elsa', 'elvish', 'embedded_template', 'enforce', 'erlang', 'facility', 'faust', 'fennel', 'fidl', 'firrtl', 'fish', 'foam', 'forth', 'fortran', 'fsharp', 'fsh', 'func', 'fusion', 'gap', 'gaptst', 'gdscript', 'gdshader', 'gitattributes', 'gitcommit', 'git_config', 'gitignore', 'git_rebase', 'gleam', 'glimmer_javascript', 'glimmer', 'glimmer_typescript', 'glsl', 'gn', 'gnuplot', 'goctl', 'godot_resource', 'gomod', 'go', 'gosum', 'gotmpl', 'gowork', 'gpg', 'graphql', 'gren', 'groovy', 'gstlaunch', 'hack', 'hare', 'haskell_persistent', 'haskell', 'hcl', 'heex', 'helm', 'hjson', 'hlsl', 'hlsplaylist', 'hocon', 'hoon', 'htmldjango', 'html', 'http', 'hurl', 'hyprlang', 'idl', 'idris', 'ini', 'inko', 'ispc', 'janet_simple', 'javadoc', 'javascript', 'java', 'jinja_inline', 'jinja', 'jq', 'jsdoc', 'json5', 'jsonc', 'jsonnet', 'json', 'julia', 'just', 'kcl', 'kconfig', 'kdl', 'kotlin', 'koto', 'kusto', 'lalrpop', 'ledger', 'leo', 'linkerscript', 'liquid', 'liquidsoap', 'llvm', 'luadoc', 'luap', 'lua', 'luau', 'm68k', 'make', 'markdown_inline', 'markdown', 'matlab', 'menhir', 'mermaid', 'meson', 'muttrc', 'nasm', 'nginx', 'nickel', 'nim_format_string', 'nim', 'ninja', 'nix', 'norg', 'nqc', 'nu', 'objc', 'objdump', 'ocaml_interface', 'ocaml', 'odin', 'pascal', 'passwd', 'pem', 'perl', 'phpdoc', 'php_only', 'php', 'pioasm', 'pod', 'poe_filter', 'pony', 'po', 'powershell', 'printf', 'prisma', 'problog', 'prolog', 'promql', 'properties', 'proto', 'prql', 'psv', 'pug', 'puppet', 'purescript', 'pymanifest', 'python', 'ql', 'qmldir', 'qmljs', 'query', 'racket', 'ralph', 'rasi', 'razor', 'rbs', 're2c', 'readline', 'regex', 'rego', 'requirements', 'rescript', 'rnoweb', 'robot', 'robots', 'roc', 'ron', 'r', 'rst', 'ruby', 'runescript', 'rust', 'scala', 'scheme', 'scss', 'sflog', 'slang', 'slim', 'slint', 'smali', 'smithy', 'snakemake', 'solidity', 'soql', 'sosl', 'sourcepawn', 'sparql', 'sql', 'squirrel', 'ssh_config', 'starlark', 'strace', 'styled', 'supercollider', 'superhtml', 'surface', 'svelte', 'sway', 'sxhkdrc', 'systemtap', 't32', 'tablegen', 'tact', 'tcl', 'templ', 'tera', 'terraform', 'textproto', 'thrift', 'tiger', 'tlaplus', 'tmux', 'todotxt', 'toml', 'tsv', 'tsx', 'turtle', 'twig', 'typescript', 'typespec', 'typoscript', 'typst', 'udev', 'ungrammar', 'usd', 'uxntal', 'vala', 'vento', 'verilog', 'vhdl', 'vhs', 'vimdoc', 'vim', 'vrl', 'v', 'vue', 'wgsl_bevy', 'wgsl', 'wing', 'wit', 'xcompose', 'xml', 'xresources', 'yaml', 'yang', 'yuck', 'zathurarc', 'ziggy_schema', 'ziggy', 'zig' },
                callback = function()
                    vim.treesitter.start()

                    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                    vim.wo[0][0].foldmethod = 'expr'

                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        -- event = "VeryLazy",
        event = { "BufReadPost", "BufAdd", "BufNewFile" },
    },
    {
        --  'nvim-treesitter/nvim-treesitter-context'
        "nvim-treesitter/nvim-treesitter-context",
        -- event = { "BufNewFile", "BufReadPre" },
        event = { "BufReadPost", "BufAdd", "BufNewFile" },
        -- event = "VeryLazy",
        config = function ()
            require("treesitter-context").setup({
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                multiwindow = true, -- Enable multiwindow support.
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
                line_numbers = true,
                multiline_threshold = 20, -- Maximum number of lines to show for a single context
                trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                mode = 'topline',  -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
                zindex = 20, -- The Z-index of the context window
                on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
            })
        end
    }
}
