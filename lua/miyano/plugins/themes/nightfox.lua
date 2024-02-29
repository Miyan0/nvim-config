--================================================================
-- nightfox.lua
--================================================================
-- lua/miyano/plugins/themes/nightfox.lua
-- created: 2023-09-09

return {
  "EdenEast/nightfox.nvim",
  priority = 1000,
  lazy = false,
  name = "nightfox",
  config = function()
    vim.cmd([[colorscheme nightfox]])
  end,
}
