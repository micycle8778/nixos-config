return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup()
        vim.keymap.set(
            "n",
            "<leader>o",
            function() vim.cmd("Oil") end
        )
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
