--================================================================
-- comment.lua
--================================================================
-- lua/miyano/plugins/comment.lua
-- created: 2023-09-13
-- comment lines or blocks

return {

  "numToStr/Comment.nvim",
  event = { "BufRead", "BufNewFile" },
  --[[ config = function()
    require("Comment").setup({
      ignore = "^$",
      toggler = {
        line = "<leader>/",
        block = "<c-/>",
      },
      opleader = {
        line = "<leader>/",
        block = "<c-/>",
      },
    })
  end, ]]
  config = function()
    local keymap = vim.keymap -- for conciseness
    -- copied from nvchad mappings
    keymap.set({ "n" }, "<leader>/", function()
      require("Comment.api").toggle.linewise.current()
    end, { desc = "Toggle Comment" })

    keymap.set(
      "v",
      "<leader>/",
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      { desc = "Toggle Block Comment" }
    )
  end,
}
