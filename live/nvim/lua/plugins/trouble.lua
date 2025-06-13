return {
 "folke/trouble.nvim",
 dependencies = { "nvim-tree/nvim-web-devicons" },
 config = function()
     local trouble = require("trouble")
     trouble.setup {
         action_keys = {
             jump_close = {"<CR>"}
         }
     }

     vim.keymap.set("n", "<leader>t", function() 
         trouble.toggle("workspace_diagnostics") 
    end)
 end
}
