return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup {
            on_attach = function(buf)
                local gitsigns = require('gitsigns')
                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                map("n", "<leader>su", gitsigns.reset_hunk)
                map("n", "<leader>sU", gitsigns.reset_buffer)

                map("n", "<leader>ss", gitsigns.stage_hunk)
                map("n", "<leader>sS", gitsigns.stage_buffer)

                map("n", "<leader>sn", gitsigns.undo_stage_hunk)
                -- map("n", "<leader>sN", gitsigns.undo_stage_buffer) -- TODO:
                
                map("n", "<leader>sd", gitsigns.diffthis)

                map("n", "<leader>sb", gitsigns.toggle_current_line_blame)
            end
        }
    end,
    lazy = false
}
