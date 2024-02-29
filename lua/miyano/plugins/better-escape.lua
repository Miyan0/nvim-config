--================================================================
-- better-escape.lua
--================================================================
-- lua/miyano/plugins/better-escape.lua
-- created: 2023-09-13
-- faster `jk` remapping

return {
  "max397574/better-escape.nvim",
  event = "InsertEnter",
  config = function()
    -- lua, default settings
    require("better_escape").setup({
      mapping = { "jk" }, -- a table with mappings to use
      timeout = vim.o.timeoutlen,
      clear_empty_lines = false,
      keys = "<Esc>",
    })
  end,
}
