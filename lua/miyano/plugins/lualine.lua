--================================================================
-- lualine.lua
--================================================================
-- lua/miyano/plugins/lualine.lua
-- modified: 2024-02-29

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count

        -- configure lualine with modified theme
        lualine.setup({
            options = {
                theme = "palenight",
                -- theme = "cozynight",
                icon_enabled = true,
                component_separators = { left = "", right = "│" },
                -- section_separators = { left = "", right = "" },
                -- component_separators = "",
                -- section_separators = "",
            },
            sections = {
                -- lualine_b = { { "b:gitsigns_head", icon = "" } },
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = "#ff9e64" },
                    },
                    { "encoding" },
                    { "fileformat" },
                    {
                        function()
                            return require("copilot_status").status_string()
                        end,
                        cnd = function()
                            return require("copilot_status").enabled()
                        end,
                        color = { fg = "#94e2d5" },
                    },
                    { "filetype" },

                    {
                        function()
                            return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
                        end,
                    },
                },
            },
        })
    end,
}
