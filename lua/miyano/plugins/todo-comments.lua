--================================================================
-- todo-comments.lua
--================================================================
-- lua/miyano/plugins/todo-comments.lua
-- created: 2023-09-13
-- todos

return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  -- config = function()
  -- require("todo-comments").setup {}
  --
  -- end,
  opts = {},
  event = "BufRead",
  cmd = { "TodoQuickFix" },
  keys = {
    { "<leader>T", "<cmd>TodoTelescope<cr>", desc = "Open TODOS in Telescope" },
  },
}
