-- this file is for plugins that don't need any configurations

return {
  -- "inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)

  -- delete buffers while keeping window layout
  "famiu/bufdelete.nvim",

  -- maximize window
  {
    "szw/vim-maximizer",
    keys = {
      { "<leader>sm", "<cmd>MaximizerToggle<CR>" },
    },
  },
  -- "catppuccin/nvim",

  -- require("miyano.plugins.themes.monokaipro"),
  require("miyano.plugins.themes.catppuccin"),
  -- require("miyano.plugins.themes.github"),
  -- require("miyano.plugins.themes.kanagawa"),
  -- require("miyano.plugins.themes.oxocarbon"),
  -- require("miyano.plugins.themes.aquarium"),
  -- require("miyano.plugins.themes.nightfox"),
  -- require("miyano.plugins.themes.tokyonight"),
}
