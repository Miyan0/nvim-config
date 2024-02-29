--================================================================
-- tokyonight.lua
--================================================================
-- lua/miyano/plugins/themes/tokyonight.lua
-- created: 2023-09-09

return {
	"folke/tokyonight.nvim",
	priority = 1000,
	lazy = false,
	name = "tokyonight",
	config = function()
		vim.cmd([[colorscheme tokyonight]])
	end,
}
