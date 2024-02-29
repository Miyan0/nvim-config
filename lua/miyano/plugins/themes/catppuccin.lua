--================================================================
-- catppuccin.lua
--================================================================
-- lua/miyano/plugins/themes/catppuccin.lua
-- created: 2023-09-10

return {
  "catppuccin/nvim",
  priority = 1000,
  lazy = false,
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      term_colors = true,
      color_overrides = {
        macchiato = {
          rosewater = "#efc9c2",
          flamingo = "#ebb2b2",
          pink = "#e18cf5",
          mauve = "#b889f4",
          red = "#ea7183",
          maroon = "#ea838c",
          peach = "#f39967",
          yellow = "#FFE169",
          green = "#96d382",
          teal = "#78cec1",
          sky = "#91d7e3",
          sapphire = "#68bae0",
          blue = "#61AFFF",
          lavender = "#BDC1E2",
          text = "#b5c1f1",
          subtext1 = "#a6b0d8",
          subtext0 = "#959ec2",
          overlay2 = "#848cad",
          overlay1 = "#717997",
          overlay0 = "#63677f",
          surface2 = "#505469",
          surface1 = "#3e4255",
          surface0 = "#2c2f40",
          -- base = "#1a1c2a",
          base = "#1e1f22",
          mantle = "#17181A",
          crust = "#0e0f16",
        },
      },

      -- highlight_overrides = {
      --   all = function(colors)
      --     return {
      --       PmenuSel = { bg = colors.pink, fg = colors.base },
      --       TabLineSel = { bg = colors.mauve, fg = colors.mauve },
      --       CmpBorder = { fg = colors.surface2 },
      --       Pmenu = { bg = colors.none },
      --       Comment = { fg = colors.overlay0 },
      --       -- FloatBorder = { bg = "#3c3836" },
      --       -- NormalFloat = { bg = colors.mauve, fg = colors.base },
      --     }
      --   end,
      -- },

      custom_highlights = function(colors)
        return {
          PmenuSel = { bg = colors.pink, fg = colors.base },
          TabLineSel = { bg = colors.mauve, fg = colors.mauve },
          CmpBorder = { fg = colors.peach },
          -- Pmenu = { bg = colors.none },
          Comment = { fg = colors.overlay2 },
          -- TabLineSel = { bg = colors.pink },
          -- CmpBorder = { fg = colors.surface2 },
          -- Pmenu = { bg = colors.none },
        }
      end,
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
    })
    vim.cmd([[colorscheme catppuccin-mocha]])
  end,
}
