return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require'nvim-treesitter.configs'.setup {
                auto_install = true,

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }

            vim.cmd[[
            set foldmethod=expr
            set foldexpr=nvim_treesitter#foldexpr()
            ]]
        end,
        build = ":TSUpdate"
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
            multiline_threshold = 5,
        },
    }
}
