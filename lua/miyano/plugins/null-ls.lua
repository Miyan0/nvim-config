--================================================================
-- null-ls.lua
--================================================================
-- lua/miyano/plugins/null-ls.lua
-- created: 2023-09-13
-- linting and formatting

return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  ft = { "go", "lua", "json", "python", "sql" },

  config = function()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local null_ls = require("null-ls")

    null_ls.setup({

      sources = {

        -- golang
        -- null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.golines,

        -- python
        -- null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.black,

        -- lua
        null_ls.builtins.formatting.stylua,

        -- json
        -- null_ls.builtins.formatting.jq,

        -- python template
        null_ls.builtins.formatting.djlint.with({
          filetypes = { "html" },
        }),

        -- html formatter
        -- null_ls.builtins.formatting.djhtml,
        null_ls.builtins.formatting.prettier,
      },
      -- format on save
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = bufnr,
          })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
  end,
}
