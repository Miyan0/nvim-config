--================================================================
-- moonfly.lua
--================================================================
-- lua/miyano/plugins/moonfly.lua
-- created: 2023-09-13

return {
  "bluz71/vim-moonfly-colors",
  lazy = false,   -- make sure we load this during startup if it is your main colorscheme
  name = "moonfly",
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    vim.cmd("colorscheme moonfly")
  end,
}
