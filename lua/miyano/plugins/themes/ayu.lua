--================================================================
-- ayu.lua
--================================================================
-- lua/miyano/plugins/themes/ayu.lua
-- created: 2023-09-10

return {
	"Shatur/neovim-ayu",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	name = "ayu",

	config = function()
		local colors = require("ayu.colors")
		colors.generate() -- pass 'true' to enable mirage

		require("ayu").setup({
			mirage = false, -- use dark instead of mirage
			overrides = {
				PmenuSel = { bg = "#569CD6", fg = colors.bg },
			},
		})

		vim.cmd("colorscheme ayu")
	end,
}
