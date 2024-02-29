local M = {}

-- format *.templ files
local custom_format = function()
  if vim.bo.filetype == "templ" then
    local bufnr = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local cmd = "templ fmt " .. vim.fn.shellescape(filename)

    vim.fn.jobstart(cmd, {
      on_exit = function()
        -- Reload the buffer only if it's still the current buffer
        if vim.api.nvim_get_current_buf() == bufnr then
          vim.cmd("e!")
        end
      end,
    })
  else
    vim.lsp.buf.format()
  end
end

-- local on_attach = function(client, bufnr)
-- local opts = { buffer = bufnr, remap = false }
-- other configuration options
-- vim.keymap.set("n", "<leader>lf", custom_format, opts)
-- end

M.lsp_mappigs = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local keymap = vim.keymap -- for conciseness

  -- set keybinds
  -- opts.desc = "Show LSP references"
  -- keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

  -- format *.templ files (2024-02-21)
  vim.keymap.set("n", "<leader>lf", custom_format, opts)

  opts.desc = "Go to declaration"
  keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

  opts.desc = "Show LSP definitions"
  -- keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
  keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definitions

  opts.desc = "Show LSP implementations"
  keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- show lsp implementations

  opts.desc = "Show LSP type definitions"
  keymap.set("n", "gt", vim.lsp.buf.type_definition, opts) -- show lsp type definitions

  -- see available code actions, in visual mode will apply to selection
  opts.desc = "See available code actions"
  keymap.set({ "n", "v" }, "<leader>.", vim.lsp.buf.code_action, opts)

  -- opts.desc = "LSP rename all"
  keymap.set("n", "<leader>ra", vim.lsp.buf.rename, opts) -- smart rename

  opts.desc = "Show buffer diagnostics"
  keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

  opts.desc = "Show line diagnostics"
  keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

  opts.desc = "Go to previous diagnostic"
  keymap.set("n", "gj", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

  opts.desc = "Go to next diagnostic"
  keymap.set("n", "gk", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

  opts.desc = "Show documentation for what is under cursor"
  keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

  opts.desc = "Restart LSP"
  keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

  -- typescript specific keymaps (e.g. rename file and update imports)
  if client.name == "tsserver" then
    opts.desc = "Rename file and update file imports"
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>") -- rename file and update imports

    opts.desc = "Rename file and update file imports"
    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>", opts) -- organize imports (not in youtube nvim video)

    opts.desc = "Remove unused imports"
    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>", opts) -- remove unused variables (not in youtube nvim video)
  end
end

M.dap = function()
  vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
  vim.keymap.set("n", "<leader>dus", function()
    local widgets = require("dap.ui.widgets")
    local sidebar = widgets.sidebar(widgets.scopes)
    sidebar.open()
  end, { desc = "Open debuggin sidebar" })
end

M.dap_go = function()
  vim.keymap.set("n", "<leader>dgt", function()
    require("dap-go").debug_test()
  end, { desc = "Debug go test" })

  vim.keymap.set("n", "<leader>dgl", function()
    require("dap-go").debug_last()
  end, { desc = "Debug last go test" })
end

M.gopher = function()
  vim.keymap.set("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>", { desc = "Add json struct tags" })
end

return M
