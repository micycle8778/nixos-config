local M = {}

function M.start_debugging() 
    require('dap').continue()
end

return M
