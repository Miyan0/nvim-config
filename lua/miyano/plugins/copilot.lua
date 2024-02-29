return {
    -- copied from LazyVim extras

    -- {
    --   "zbirenbaum/copilot.lua",
    --   cmd = "Copilot",
    --   build = ":Copilot auth",
    --   event = "InsertEnter",
    --
    --   config = function()
    --     require("copilot").setup({
    --       suggestion = { enabled = true }, -- let copilot-cmp do its things
    --       panel = { enabled = true },
    --       filetypes = {
    --         markdown = true,
    --         help = true,
    --         lua = true,
    --         vim = true,
    --         typescript = true,
    --         typescriptreact = true,
    --         javascript = true,
    --         javascriptreact = true,
    --         html = true,
    --         css = true,
    --         go = true,
    {
        "zbirenbaum/copilot.lua",
        enabled = true,
        dependencies = {
            "hrsh7th/nvim-cmp",
        },
        cmd = "Copilot",
        build = ":Copilot auth",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                panel = {
                    enabled = true,
                    auto_refresh = true,
                },
                suggestion = {
                    enabled = true,
                    -- use the built-in keymapping for "accept" (<M-l>)
                    auto_trigger = true,
                    accept = false, -- disable built-in keymapping
                    debounce = 75,
                    keymap = {
                        accept = "<Tab>",
                        accept_word = false,
                        accept_line = false,
                        next = "<M-]>",
                        prev = "<M-[>",
                        dismiss = "<C-]>",
                    },
                },
            })

            -- hide copilot suggestions when cmp menu is open
            -- to prevent odd behavior/garbled up suggestions
            local cmp_status_ok, cmp = pcall(require, "cmp")
            if cmp_status_ok then
                cmp.event:on("menu_opened", function()
                    vim.b.copilot_suggestion_hidden = true
                end)

                cmp.event:on("menu_closed", function()
                    vim.b.copilot_suggestion_hidden = false
                end)
            end
        end,
    },

    {
        "jonahgoldwastaken/copilot-status.nvim",
        event = "BufReadPost",
        lazy = true,
        config = function()
            require("copilot_status").setup({
                icons = {
                    idle = " ",
                    error = " ",
                    offline = " ",
                    warning = " ",
                    loading = " ",
                },
                debug = false,
            })
        end,
    },
}

--[[

return {
    -- copied from LazyVim extras
    {
        "github/copilot.vim",
        lazy = false,
        config = function()
            -- Mapping tab is already used by NvChad
            vim.g.copilot_no_tab_map = true
            vim.g.copilot_assume_mapped = true
            vim.g.copilot_tab_fallback = ""
            vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
            -- The mapping is set to other key, see custom/lua/mappings
            -- or run <leader>ch to see copilot mapping section
        end,
    },

    -- {
    --   "zbirenbaum/copilot.lua",
    --   cmd = "Copilot",
    --   build = ":Copilot auth",
    --   event = "InsertEnter",
    --
    --   config = function()
    --     require("copilot").setup({
    --       suggestion = { enabled = true }, -- let copilot-cmp do its things
    --       panel = { enabled = true },
    --       filetypes = {
    --         markdown = true,
    --         help = true,
    --         lua = true,
    --         vim = true,
    --         typescript = true,
    --         typescriptreact = true,
    --         javascript = true,
    --         javascriptreact = true,
    --         html = true,
    --         css = true,
    --         go = true,
    --       },
    --     })
    --   end,
    -- },

    {
        "jonahgoldwastaken/copilot-status.nvim",
        event = "BufReadPost",
        lazy = true,
        config = function()
            require("copilot_status").setup({
                icons = {
                    idle = " ",
                    error = " ",
                    offline = " ",
                    warning = " ",
                    loading = " ",
                },
                debug = false,
            })
        end,
    },
}


]]
