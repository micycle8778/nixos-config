local utils = require("debug_utils")

function utils.start_debugging()
    vim.cmd.RustLsp("debug")
end

vim.keymap.set("n", "<leader>r", function() vim.cmd("RustLsp! run") end);
