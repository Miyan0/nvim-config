--================================================================
-- biscuits.lua
--================================================================
-- lua/miyano/plugins/biscuits.lua
-- created: 2023-09-13
-- in editor annotations
-- https://github.com/code-biscuits/nvim-biscuits

return {
  {
    "code-biscuits/nvim-biscuits",
    event = "BufReadPost",
    config = function()
      local present, biscuits = pcall(require, "nvim-biscuits")

      if not present then
        print("biscuits not loaded")
        return
      end

      biscuits.setup({
        show_on_start = true,
        cursor_line_only = true,
        default_config = {
          min_distance = 10,
          max_length = 50,
          prefix_string = " 󰆘 ",
          prefix_highlight = "Comment",
          enable_linehl = true,
        },
      })
    end,
  },
}
