--================================================================
-- autocmds.lua
--================================================================
-- lua/miyano/utils/autocmds.lua
-- created: 2023-09-11
-- Note: most of this comes from my copied NvChad config.

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

------------------------------------------------------------------
-- TUTORIAL Tj
------------------------------------------------------------------
-- https://www.youtube.com/watch?v=ekMIIAqTZ34
-- to see all autocmds: :au
-- to see one particular autocmd: :au BufEnter

-- autocmd("BufEnter", { command = "echo 'hello'" })

------------------------------------------------------------------
-- NVTREE
------------------------------------------------------------------

-- NOTE: try this when we've implemented sessions.

-- Fix NvimTree not opening on startup when using session restore plugin
autocmd({ "BufEnter" }, {
  pattern = "NvimTree*",
  callback = function()
    local api = require("nvim-tree.api")
    local view = require("nvim-tree.view")
    if not view.is_visible() then
      api.tree.open()
    end
  end,
})

-- Close Nvimtree before quit nvim
autocmd("FileType", {
  pattern = { "NvimTree" },
  callback = function(args)
    autocmd("VimLeavePre", {
      callback = function()
        vim.api.nvim_buf_delete(args.buf, { force = true })
        return true
      end,
    })
  end,
})

-- -- Open new buffer if only Nvimtree is open
--autocmd("BufEnter", {
--	nested = true,
--	callback = function()
--		local api = require("nvim-tree.api")
--		if #vim.api.nvim_list_wins() == 1 and api.tree.is_tree_buf() then
--			vim.defer_fn(function()
--				api.tree.toggle({ find_file = true, focus = true })
--				api.tree.toggle({ find_file = true, focus = true })
--				vim.cmd("wincmd p")
--			end, 0)
--		end
--	end,
--})

------------------------------------------------------------------
-- MISC
------------------------------------------------------------------

-- Don't auto comment new line
autocmd("BufEnter", {
  command = [[set formatoptions-=cro]],
})

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- Go to last loc when opening a buffer
autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

------------------------------------------------------------------
-- UTILS
------------------------------------------------------------------

-- Highlight on yank
autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank({higroup='IncSearch', timeout=200})",
  group = augroup("YankHighlight", { clear = true }),
})

-- Disable status column in the following files
autocmd({ "FileType", "BufWinEnter" }, {
  callback = function()
    local ft_ignore = {
      "man",
      "help",
      "neo-tree",
      "starter",
      "TelescopePrompt",
      "Trouble",
      "NvimTree",
      "nvcheatsheet",
      "dapui_watches",
      "dap-repl",
      "dapui_console",
      "dapui_stacks",
      "dapui_breakpoints",
      "dapui_scopes",
    }

    local b = vim.api.nvim_get_current_buf()
    local f = vim.api.nvim_buf_get_option(b, "filetype")
    for _, e in ipairs(ft_ignore) do
      if f == e then
        vim.api.nvim_win_set_option(0, "statuscolumn", "")
        return
      end
    end
  end,
})

-- Show cursor line only in active window
-- autocmd({ "InsertLeave", "WinEnter" }, {
--   pattern = "*",
--   command = "set cursorline",
--   group = augroup("CursorLine", { clear = true }),
-- })
-- autocmd({ "InsertEnter", "WinLeave" }, {
--   pattern = "*",
--   command = "set nocursorline",
--   group = augroup("CursorLine", { clear = true }),
-- })

-- Restore cursor
autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    vim.api.nvim_exec('silent! normal! g`"zv', false)
  end,
})

-- Nvimtree open file on creation
local function open_file_created()
  require("nvim-tree.api").events.subscribe("FileCreated", function(file)
    vim.cmd("edit " .. file.fname)
  end)
end

autocmd({ "VimEnter" }, {
  callback = open_file_created,
})

-- Go to last used hidden buffer when deleting a buffer
autocmd("BufEnter", {
  nested = true,
  callback = function()
    local api = require("nvim-tree.api")

    -- Only 1 window with nvim-tree left: we probably closed a file buffer
    if #vim.api.nvim_list_wins() == 1 and api.tree.is_tree_buf() then
      -- Required to let the close event complete. An error is thrown without this.
      vim.defer_fn(function()
        -- close nvim-tree: will go to the last hidden buffer used before closing
        api.tree.toggle({ find_file = true, focus = true })
        -- re-open nivm-tree
        api.tree.toggle({ find_file = true, focus = true })
        -- nvim-tree is still the active window. Go to the previous window.
        vim.cmd("wincmd p")
      end, 0)
    end
  end,
})

-- Windows to close with "q"
autocmd("FileType", {
  pattern = {
    "help",
    "startuptime",
    "qf",
    "lspinfo",
    "man",
    "checkhealth",
    "tsplayground",
    "HIERARCHY-TREE-GO",
    "dap-float",
    "null-ls-info",
    "empty",
    "neotest-output",
    "neotest-summary",
    "neotest-output-panel",
    "trouble",
  },
  command = [[
            nnoremap <buffer><silent> q :close<CR>
            set nobuflisted
        ]],
})
