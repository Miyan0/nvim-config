--================================================================
-- formatting.lua
--================================================================
-- lua/miyano/plugins/formatting.lua
-- created: 2024-02-29
-- replacing null-ls with conform
-- https://www.youtube.com/watch?v=ybUE4D80XSk

return {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufWritePre", "BufNewFile" },
    config = function()
        local conform = require("conform")
        conform.setup({
            formatter_by_ft = {
                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                lua = { "stylua" },
                go = { "goimport", "gofumpt", "goimport-reviser", "golines" },
                templ = { "templ" },
                python = { "isort", "black" },
            },
            format_on_save = {
                lsp_fallback = true,
                async = true,
                timeout_ms = 500,
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                async = true,
                timeout_ms = 500,
            })
        end, { desc = "Format file or range (visual mode)" })
    end,
}
