--================================================================
-- aquarium.lua
--================================================================
-- lua/miyano/plugins/themes/aquarium.lua
-- created: 2023-09-09

return {
  "frenzyexists/aquarium-vim",
  priority = 1000,
  lazy = false,
  name = "aquarium",
  config = function()
    -- require("aquarium-vim").setup({
    -- 	overrides = {a
    --[[ highlight PmenuSel = { bg = "#de956f", fg = "#20202a" } ]]
    Cursor = { bg = "#de956f", fg = "#20202a" }
    -- 	},
    -- })
    vim.cmd([[colorscheme aquarium]])
  end,
}
