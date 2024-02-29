--================================================================
-- nvim-tree.lua
--================================================================
-- lua/miyano/plugins/nvim-tree.lua
-- created: 2023-09-13

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- configure nvim-tree
    nvimtree.setup({
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      view = {
        adaptive_size = false,
        side = "left",
        width = 30,
        preserve_window_proportions = true,
      },

      git = {
        ignore = false,
        enable = true,
      },

      filters = {
        custom = { ".DS_Store", "^.git$", ".idea", ".venv", "*.egg-info", "__pycache__", ".*_templ.go" },
        dotfiles = false,
      },

      diagnostics = {
        enable = false,
        show_on_dirs = false,
        debounce_delay = 50,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      filesystem_watchers = {
        enable = true,
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
      renderer = {
        root_folder_label = false,
        highlight_git = false,
        highlight_opened_files = "name",

        indent_markers = {
          enable = true,
        },

        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },

          glyphs = {
            default = "󰈚",
            symlink = "",
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
              arrow_open = "",
              arrow_closed = "",
            },
            git = {
              unstaged = "",
              -- unstaged = "",
              staged = "",
              unmerged = "",
              renamed = "➜",
              -- untracked = "",
              untracked = "",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      tab = {
        sync = {
          open = true,
          close = true,
        },
      },
      -- add other options here
      --
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus <CR>", { desc = "Focus NvimTree" })
    keymap.set("n", "<C-n>", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle NvimTree" })
  end,
}
