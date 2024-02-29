--================================================================
-- monokeipro.lua
--================================================================
-- lua/miyano/plugins/themes/monokeipro.lua
-- created: 2023-09-09

colors = {
  dark2 = "#19181a",
  dark1 = "#221f22",
  background = "#2d2a2e",
  text = "#fcfcfa",
  accent1 = "#ff6188",
  accent2 = "#fc9867",
  accent3 = "#ffd866",
  accent4 = "#a9dc76",
  accent5 = "#78dce8",
  accent6 = "#ab9df2",
  dimmed1 = "#c1c0c0",
  dimmed2 = "#939293", -- border
  dimmed3 = "#727072",
  dimmed4 = "#5b595c",
  dimmed5 = "#403e41",
}

return {
  "loctvl842/monokai-pro.nvim",
  lazy = false,   -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- load the colorscheme here
    require("monokai-pro").setup({
      override = function()
        return {
          PmenuSel = { bg = colors.accent3, fg = colors.background },
          TabLineSel = { bg = colors.accent3, fg = colors.accent3 },
          Cursor = { bg = colors.accent6, fg = colors.background },
        }
      end,
      transparent_background = false,
      terminal_colors = true,
      devicons = true, -- highlight the icons of `nvim-web-devicons`
      styles = {
        comment = { italic = true },
        keyword = { italic = true },   -- any other keyword
        type = { italic = true },      -- (preferred) int, long, char, etc
        storageclass = { italic = true }, -- static, register, volatile, etc
        structure = { italic = true }, -- struct, union, enum, etc
        parameter = { italic = true }, -- parameter pass in function
        annotation = { italic = true },
        tag_attribute = { italic = true }, -- attribute of tag in reactjs
      },
      filter = "spectrum",             -- classic | octagon | pro | machine | ristretto | spectrum
      -- Enable this will disable filter option
      day_night = {
        enable = false,        -- turn off by default
        day_filter = "pro",    -- classic | octagon | pro | machine | ristretto | spectrum
        night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
      },
      inc_search = "background", -- underline | background
      background_clear = {
        -- "float_win",
        "toggleterm",
        "telescope",
        -- "which-key",
        "renamer",
        "notify",
        -- "nvim-tree",
        -- "neo-tree",
        -- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
      }, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
      plugins = {
        bufferline = {
          underline_selected = true,
          underline_visible = true,
        },
        indent_blankline = {
          context_highlight = "pro", -- default | pro
          context_start_underline = false,
        },
      },
    })
    vim.cmd([[colorscheme monokai-pro]])
  end,
}
