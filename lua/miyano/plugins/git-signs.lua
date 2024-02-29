--================================================================
-- git-signs.lua
--================================================================
-- lua/miyano/plugins/git-signs.lua
-- created: 2023-09-13

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "󰍵" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "│" },
      },
    })
  end,
}
