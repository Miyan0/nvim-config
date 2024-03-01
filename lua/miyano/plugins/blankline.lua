-- ----------------------------------------------------------------------
--- BlankLine
--- ----------------------------------------------------------------------
--- https://github.com/lukas-reineke/indent-blankline.nvim

local M = {}

-- TODO: change colors as their too bright.
local hl_list = {}

for i, color in pairs({ "#324b7b", "#767621", "#216631", "#325a5e", "#324b7b", "#562155" }) do
    local name = "IndentBlanklineIndent" .. i
    vim.api.nvim_set_hl(0, name, { fg = color })
    table.insert(hl_list, name)
end

M.blankline = {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    lazy = false,
    config = function()
        require("ibl").setup({
            indent = {
                highlight = hl_list,
                char = "│",
                tab_char = "│",
            },
            -- whitespace = {
            --   highlight = hl_list,
            --   remove_blankline_trail = false,
            -- },
            scope = {
                enabled = false,
                -- highlight = hl_list,
                -- show_start = false,
                -- show_end = false,
                -- injected_languages = true,
            },
            exclude = {
                filetypes = {
                    "help",
                    "terminal",
                    "lspinfo",
                    "TelescopePrompt",
                    "TelescopeResults",
                    "nvcheatsheet",
                    "lsp-installer",
                    "norg",
                    "Empty",
                    "",
                },
                buftypes = { "terminal", "nofile" },
            },
        })
    end,
}

return M.blankline
