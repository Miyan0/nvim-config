--================================================================
-- mason.lua
--================================================================
-- lua/miyano/plugins/lsp/mason.lua
-- modified: 2024-02-29 (removed null-ls)

return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- import mason plugin safely
        local mason = require("mason")

        -- import mason-lspconfig plugin safely
        local mason_lspconfig = require("mason-lspconfig")

        -- import mason-tool-installer
        local mason_tool_installer = require("mason-tool-installer")

        -- enable mason
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "tsserver",
                "html",
                "cssls",
                "tailwindcss",
                "lua_ls",
                "emmet_ls",
                "jsonls",
                "gopls",
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })

        -- install mason tools
        mason_tool_installer.setup({
            -- list of tools for mason to install
            ensure_installed = {
                "eslint_d",
                "prettier",
                "stylua",
                "isort",
                "black",
                "pylint",
            },
            -- auto-install configured tools
            automatic_installation = true,
        })
    end,
}
