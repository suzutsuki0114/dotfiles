return {
    {
        "williamboman/mason.nvim",
        -- version = "1.11.0",
        event = "VeryLazy",
        -- event = "VimEnter",
        config = function ()
            -- アイコン設定
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = '',
                        [vim.diagnostic.severity.WARN] = '',
                        [vim.diagnostic.severity.INFO] = '',
                        [vim.diagnostic.severity.HINT] = '󰌵',
                    },
                }
            })

            -- LSPサーバアタッチ時の処理
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(ctx)
                    local set = vim.keymap.set
                    set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { buffer = true })
                    set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = true })
                    set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { buffer = true })
                    set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = true })
                    -- set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { buffer = true })
                    set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", { buffer = true })
                    set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", { buffer = true })
                    set("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", { buffer = true })
                    set("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { buffer = true })
                    set("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = true })
                    set("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { buffer = true })
                    set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = true })
                    set("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", { buffer = true })
                    set("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", { buffer = true })
                    set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", { buffer = true })
                    set("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", { buffer = true })
                    set("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", { buffer = true })
                end,
            })

            -- プラグインの設定
            require("mason").setup()
            require("mason-lspconfig").setup {}
            -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
            -- require("mason-lspconfig").setup_handlers({
            --     function(server_name)
            --         require("lspconfig")[server_name].setup({
            --             capabilities = capabilities,
            --         })
            --     end,
            -- })
            vim.cmd('LspStart')
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        -- version = "1.32.0",
        lazy = true,
        -- event = "VimEnter",
    },
    {
        "neovim/nvim-lspconfig",
        -- event = "VimEnter",
        event = "VeryLazy",
    },
}
