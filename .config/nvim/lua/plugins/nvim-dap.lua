return {
    {
        'mfussenegger/nvim-dap',
        config = function()
            local dap = require("dap")
            -- dapへアダプタを登録
            dap.adapters.codelldb = {
                type = "executable",
                command = "codelldb",
                args = {
                    "--settings",
                    vim.json.encode({
                        showDisassembly = "never",
                    }),
                },
            }
            dap.adapters.bashdb = {
                type = 'executable';
                command = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/bash-debug-adapter';
                name = 'bashdb';
            }

            -- ファイルタイプ・アダプタ・設定の紐づけ
            dap.configurations.c = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    -- program = function()
                    --     return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    -- end,
                    -- program = vim.fn.expand("%:p:r") .. ".out",
                    program = function()
                        -- ビルドコマンド実行（非同期でなくてもOKなら os.execute）
                        local build_cmd = "gcc -g -O0 " .. vim.fn.expand("%:p") .. " -o " .. vim.fn.expand("%:p:r") .. ".out"
                        print("[DAP] Now building...")
                        os.execute(build_cmd) -- ここで preLaunchTask 相当の処理をする

                        return vim.fn.expand("%:p:r") .. ".out"
                    end,
                    -- program = function()
                    --     print("[DAP] Now building...")
                    --     vim.system({ "gcc", "-g", "-O0", vim.fn.expand("%:p"), "-o", vim.fn.expand("%:p:r") .. ".out" }, { text = true }, function(obj)
                    --         if obj.code == 0 then
                    --             return vim.fn.expand("%:p:r") .. ".out"
                    --         else
                    --             print("[DAP] Failed:\n" .. obj.stderr)
                    --             return nil
                    --         end
                    --     end)
                    -- end,
                    args = function()
                        local input = vim.fn.input('Arguments: ')
                        return vim.split(input, " ", true)
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
            }
            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    -- program = function()
                    --     return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    -- end,
                    -- program = vim.fn.expand("%:p:r") .. ".out",
                    program = function()
                        -- ビルドコマンド実行（非同期でなくてもOKなら os.execute）
                        local build_cmd = "g++ -g -O0 " .. vim.fn.expand("%:p") .. " -o " .. vim.fn.expand("%:p:r") .. ".out"
                        print("[DAP] Now building...")
                        os.execute(build_cmd) -- ここで preLaunchTask 相当の処理をする

                        return vim.fn.expand("%:p:r") .. ".out"
                    end,
                    -- program = function()
                    --     print("[DAP] Now building...")
                    --     vim.system({ "g++", "-g", "-O0", vim.fn.expand("%:p"), "-o", vim.fn.expand("%:p:r") .. ".out" }, { text = true }, function(obj)
                    --         if obj.code == 0 then
                    --             return vim.fn.expand("%:p:r") .. ".out"
                    --         else
                    --             print("[DAP] Failed:\n" .. obj.stderr)
                    --             return nil
                    --         end
                    --     end)
                    -- end,
                    args = function()
                        local input = vim.fn.input('Arguments: ')
                        return vim.split(input, " ", true)
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
            }
            dap.configurations.rust = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    args = function()
                        local input = vim.fn.input('Arguments: ')
                        return vim.split(input, " ", true)
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                },
            }
            dap.configurations.sh = {
                {
                    type = 'bashdb',
                    request = 'launch',
                    name = "Launch file",
                    showDebugOutput = true,
                    pathBashdb = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb',
                    pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir',
                    trace = true,
                    file = "${file}",
                    program = "${file}",
                    cwd = '${workspaceFolder}',
                    pathCat = "cat",
                    pathBash = "/bin/bash",
                    pathMkfifo = "mkfifo",
                    pathPkill = "pkill",
                    args = {},
                    -- args = function()
                    --     return vim.fn.input('Path to executable: ')
                    -- end,
                    -- argsString = '',
                    argsString = function()
                        return vim.fn.input('Arguments: ')
                    end,
                    env = {},
                    terminalKind = "integrated",
                }
            }

            vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
            vim.fn.sign_define("DapBreakpointRejected", { text = "󰉥", texthl = "", linehl = "", numhl = "", })
            vim.fn.sign_define("DapLogPoint", { text = "", texthl = "", linehl = "", numhl = "" })
            vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "", numhl = "" })
        end,

        keys = {
            { "<space>du", function() require("dapui").toggle() end, desc = "toggle dap-ui", },
            { "<space>dd", function() require("dap").continue() end, desc = "Debug: start/continue", },
            { "<space>dm", function() require("dap").toggle_breakpoint() end, desc = "Debug: toggle break(mark)", },
            {
                "<space>dM",
                function()
                    require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
                end,
                desc = "Debug: set break(mark) with message",
            },
            { "<space>de", function() require("dapui").eval() end, desc = "Debug: eval at cursor", },
            { "<space>dE", function() require("dapui").eval(vim.fn.input("[Expression] > ")) end, desc = "Debug: eval expression", },
            { "<space>d[[", function() require("dap").step_back() end, desc = "Debug: step back", },
            { "<space>d]]", function() require("dap").step_over() end, desc = "Debug: step over", },
            { "<space>d}}", function() require("dap").step_into() end, desc = "Debug: step into", },
            { "<space>d{{", function() require("dap").step_out() end, desc = "Debug: step out", },
            { "<space>dh", function() require("dap.ui.widgets").hover() end, desc = "Debug: hover", },
            { "<space>dq", function() require("dap").terminate() end, desc = "Debug: terminate", },
        }
    },
    {
        'rcarriga/nvim-dap-ui',
        config = function()
            require("dapui").setup()
        end,
        keys = {
            { "<space>du", function() require("dapui").toggle() end, desc = "toggle dap-ui", },
            { "<space>de", function() require("dapui").eval() end, desc = "Debug: eval at cursor", },
            { "<space>dE", function() require("dapui").eval(vim.fn.input("[Expression] > ")) end, desc = "Debug: eval expression", },
        }
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
            require("nvim-dap-virtual-text").setup()
        end,
        lazy = true,
    },
    {
        'nvim-neotest/nvim-nio',
        lazy = true,
    }
}
