local utils = require("debug_utils")

function utils.start_debugging()
    vim.cmd("CMakeDebugCurrentFile")
end

vim.keymap.set("n", "<leader>r", function() vim.cmd("CMakeRunCurrentFile") end);
