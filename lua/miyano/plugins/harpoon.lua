return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>h", function()
      require("harpoon.ui").toggle_quick_menu()
    end, { desc = "󱠿 Harpoon Menu" })

    keymap.set("n", "<leader>a", function()
      require("harpoon.mark").add_file()
    end, { desc = "󱡁 Harpoon Add file" })

    keymap.set("n", "<leader>1", function()
      require("harpoon.ui").nav_file(1)
    end, { desc = "󱪼 Navigate to file 1" })

    keymap.set("n", "<leader>2", function()
      require("harpoon.ui").nav_file(2)
    end, { desc = "󱪽 Navigate to file 2" })

    keymap.set("n", "<leader>3", function()
      require("harpoon.ui").nav_file(3)
    end, { desc = "󱪾 Navigate to file 3" })

    keymap.set("n", "<leader>4", function()
      require("harpoon.ui").nav_file(4)
    end, { desc = "󱪿 Navigate to file 4" })
  end,
}
