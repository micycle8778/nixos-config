return { 
    "ellisonleao/gruvbox.nvim",
    config = function()
        require("gruvbox").setup({
            overrides = {
                String = {italic = false},
                Function = {bold = false}
            },
        })

        vim.cmd[[
        colorscheme gruvbox
        hi CursorLineNR guibg=#8ec07c guifg=#3c3836
        hi link Operator GruvboxBlue
        hi Normal guibg=none
        hi SignColumn guibg=none
        ]]
    end,
}
