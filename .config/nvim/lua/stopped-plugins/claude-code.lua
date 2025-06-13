return {
    {
        "greggh/claude-code.nvim",
        cmd = {
            "ClaudeCode",
            "ClaudeCodeContinue",
            "ClaudeCodeResume",
            "ClaudeCodeVerbose",
            "ClaudeCodeVersion",
        },
        config = function()
            require("claude-code").setup()
        end
    },
    {
        "nvim-lua/plenary.nvim", -- Required for git operations
        lazy = true,
    }
}
