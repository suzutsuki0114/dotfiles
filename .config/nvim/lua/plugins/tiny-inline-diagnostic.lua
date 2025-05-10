return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    -- event = "LspAttach",
    priority = 1000, -- needs to be loaded in first
    config = function()
        require('config.plugins.tiny-inline-diagnostic')
        vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
    end
}
