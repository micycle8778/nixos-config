return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
      require("todo-comments").setup()
      vim.keymap.set("n", "<leader>gt", function() vim.cmd("TodoTrouble keywords=TODO,FIX") end)
  end,
}
