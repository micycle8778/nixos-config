return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require('lsp-progress').setup({
            client_format = function(client_name, spinner, series_messages)
                if #series_messages > 0 then
                    return spinner .. "[" .. client_name .. "] "
                end
                return nil
            end,

            format = function(client_messages)
                -- icon: nf-fa-gear \uf013
                if #client_messages > 0 then
                    return client_messages[1]
                end
                return ""
            end
        })

        require("lualine").setup({
            options = {
                refresh = {
                    statusline = 50
                }
            },
            sections = {
                lualine_c = {
                    "filename"
                },
                lualine_x = {
                    function()
                        return require('lsp-progress').progress()
                    end,
                    "filetype"
                }
            }
        })
    end,
    dependencies = { "nvim-tree/nvim-web-devicons", "linrongbin16/lsp-progress.nvim" },
}
