return {
    "mfussenegger/nvim-dap",
    config = function() 
        local dap = require("dap")
        local dap_ui = require("dapui")

        dap_ui.setup()
        require("nvim-dap-virtual-text").setup()

        -- codelldb for rust and cpp
        dap.adapters.codelldb = {
            type = 'server',
            port = "13000",
            executable = {
                command = 'codelldb',
                args = {"--port", "13000"},
            },
            options = {
                initialize_timeout_sec = 10,
            }
        }

        -- Unity debugger
        dap.adapters.unity = {
            type = 'executable',
            command = 'mono',
            args = {'/home/micycle/Downloads/unity-debugger/extension/bin/UnityDebug.exe'}
        }

        dap.configurations.cs = {
            {
                type = 'unity',
                request = 'attach',
                name = 'Unity Editor (Unity)',
            }
        }

        dap.adapters.godot = {
            type = "server",
            host = "127.0.0.1",
            port = 6006,
        }

        dap.configurations.gdscript = {
            {
                type = "godot",
                request = "launch",
                name = "Launch scene",
                project = "${workspaceFolder}",
            }
        }

        -- dap.configurations.cpp = {
        --     {
        --         name = 'Launch',
        --         type = 'codelldb',
        --         request = 'launch',
        --         program = function()
        --             vim.cmd("CMakeBuildCurrentFile")
        --             return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        --         end,
        --         cwd = '${workspaceFolder}',
        --         stopOnEntry = false,
        --         args = {},
        --     }
        -- }

        vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
        vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

        -- eval var under cursor
        vim.keymap.set("n", "<leader>e", function()
            dap_ui.eval(nil, { enter = true })
        end)

        vim.keymap.set("n", "<F1>", dap.step_over);
        vim.keymap.set("n", "<F2>", dap.step_into);
        vim.keymap.set("n", "<F3>", dap.step_out);
        vim.keymap.set("n", "<F4>", dap.continue);

        vim.keymap.set("n", "<F5>", function() 
            local dap = require("dap")
            if #dap.sessions() ~= 0 then
                dap.terminate()
                dap.close()
                vim.cmd("DapVirtualTextForceRefresh")
            else
                require("debug_utils").start_debugging();
            end
        end);
        vim.keymap.set("n", "<F12>", dap.step_back);

        -- dap.listeners.before.attach.dapui_config = function()
        --     dap_ui.open()
        -- end
        --
        -- dap.listeners.before.launch.dapui_config = function()
        --     dap_ui.open()
        -- end
        --
        -- dap.listeners.before.event_terminated.dapui_config = function()
        --     dap_ui.open()
        -- end
        --
        -- dap.listeners.before.event_exited.dapui_config = function()
        --     dap_ui.open()
        -- end
    end,
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "theHamsta/nvim-dap-virtual-text",
    },
}
