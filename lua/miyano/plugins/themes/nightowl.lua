--================================================================
-- nightowl.lua
--================================================================
-- lua/miyano/plugins/themes/nightowl.lua
-- created: 2023-09-09

return {
	"oxfist/night-owl.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorschemeV
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		-- load the colorscheme here
		vim.cmd([[colorscheme night-owl]])
	end,
}
