return {
    "simrat39/symbols-outline.nvim",
    config = function()
        vim.keymap.set("n", "<leader>so", function() vim.cmd("SymbolsOutline") end, opts)

        require("symbols-outline").setup()
    end
}
