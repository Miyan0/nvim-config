--================================================================
-- which-key.lua
--================================================================
-- lua/miyano/plugins/which-key.lua
-- created: 2023-09-13
-- keybinding remainder

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {},
}
