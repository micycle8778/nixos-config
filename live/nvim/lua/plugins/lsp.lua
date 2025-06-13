return {
    "neovim/nvim-lspconfig",
    config = function()
        local lsp = require("lspconfig")

        lsp.gdscript.setup{} -- godot
        lsp.clangd.setup{} -- c
        --lsp.rust_analyzer.setup{} -- use rustaceanvim instead
        lsp.zls.setup{} -- zig 

        -- unity lsp
        lsp.omnisharp.setup {
            cmd = {"OmniSharp"}
        }

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                local opts = { buffer = ev.buf }

                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "<leader>d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "<leader>D", function() vim.diagnostic.goto_prev() end, opts)

                -- <leader>vlf lists all the possible fixes/refactors
                vim.keymap.set("n", "<leader>vlf", function() vim.lsp.buf.code_action() end, opts)

                -- <leader>vf performs the first fix/refactor
                vim.keymap.set("n", "<leader>vf", function() 
                    local count = 0

                    local start = vim.api.nvim_win_get_cursor(0)
                    local _end = vim.api.nvim_win_get_cursor(0)
                    start[2] = 0
                    _end[2] = 2000

                    vim.lsp.buf.code_action({ 
                        apply = true, 
                        context = { 
                            only = { 'quickfix' },
                        },
                        filter = function(ca) 
                            count = count + 1
                            return count == 1
                        end,
                        range = { start = start, ["end"] = _end }
                    }) 
                end, opts)

                vim.keymap.set("n", "<leader>vrr", function() require("trouble").open("lsp_references") end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end,
        })

        -- vim.g.rustaceanvim.server.on_attach = set_keymaps
    end,
    dependencies = {
        "folke/trouble.nvim"
    }
}
