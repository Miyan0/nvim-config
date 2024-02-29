--================================================================
-- kanagawa.lua
--================================================================
-- lua/miyano/plugins/themes/kanagawa.lua
-- created: 2023-09-09

return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  name = "kanagawa",
  config = function()
    require("kanagawa").setup({
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = {          -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function(colors) -- add/modify highlights
        local theme = colors.theme
        return {

          PmenuSel = { bg = "#de956f", fg = "#20202a" },
        }
      end,
      theme = "dragon", -- Load "wave" theme when 'background' option is not set
      background = { -- map the value of 'background' option to a theme
        dark = "dragon", -- try "dragon" !
        light = "lotus",
      },
    })
    vim.cmd([[colorscheme kanagawa]])
  end,
}
