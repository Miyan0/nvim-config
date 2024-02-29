--================================================================
-- miyano.lua
--================================================================
-- lua/miyano/plugins/themes/miyano.lua
-- created: 2023-09-23
-- my catppuccin version

return {
  "catppuccin/nvim",
  priority = 1000,
  lazy = false,
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      compile = {
        enabled = true,
        path = vim.fn.stdpath("cache") .. "/catppuccin",
        suffix = "_compiled",
      },
      color_overrides = {
        mocha = {
          rosewater = "#efc9c2",
          flamingo = "#ebb2b2",
          pink = "#f2a7de",
          mauve = "#b889f4",
          red = "#ea7183",
          maroon = "#ea838c",
          peach = "#f39967",
          yellow = "#eaca89",
          green = "#96d382",
          teal = "#78cec1",
          sky = "#91d7e3",
          sapphire = "#68bae0",
          blue = "#739df2",
          lavender = "#a0a8f6",
          text = "#b5c1f1",
          subtext1 = "#a6b0d8",
          subtext0 = "#959ec2",
          overlay2 = "#848cad",
          overlay1 = "#717997",
          overlay0 = "#63677f",
          surface2 = "#505469",
          surface1 = "#3e4255",
          surface0 = "#2c2f40",
          base = "#1a1c2a",
          mantle = "#141620",
          crust = "#0e0f16",
        },
      },

      highlight_overrides = {
        all = function(colors)
          return {
            PmenuSel = { bg = colors.pink, fg = colors.base },
            TabLineSel = { bg = colors.mauve, fg = colors.mauve },
            CmpBorder = { fg = colors.surface2 },
            Pmenu = { bg = colors.none },
            -- FloatBorder = { bg = "#3c3836" },
            -- NormalFloat = { bg = colors.mauve, fg = colors.base },
          }
        end,
      },

      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
      },
      transparent_background = true,
      term_colors = true,

      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },

      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        coc_nvim = false,
        lsp_trouble = false,
        cmp = true,
        lsp_saga = false,
        gitgutter = true,
        gitsigns = true,
        telescope = true,
        -- nvimtree = {
        --   enabled = false,
        --   show_root = true,
        --   transparent_panel = true,
        -- },
        dap = {
          enabled = true,
          enable_ui = true, -- enable nvim-dap-ui
        },
        which_key = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        dropbar = {
          enabled = true,
        },
        alpha = true,
        dashboard = false,
        neogit = true,
        vim_sneak = false,
        fern = false,
        barbar = false,
        bufferline = true,
        markdown = true,
        lightspeed = false,
        ts_rainbow = false,
        hop = false,
        notify = true,
        telekasten = false,
        symbols_outline = true,
        mini = true,
        fidget = false,
      },
    })
    vim.cmd([[colorscheme catppuccin-macchiato]])
    -- vim.cmd([[colorscheme catppuccin-mocha]])
  end,
}
