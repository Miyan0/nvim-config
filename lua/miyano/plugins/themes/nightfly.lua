--================================================================
-- nightfly.lua
--================================================================
-- lua/miyano/plugins/themes/nightfly.lua
-- created: 2023-09-09

return {
	"bluz71/vim-nightfly-guicolors",
	priority = 1000,
	lazy = false,
	name = "nightfly",
	config = function()
		vim.cmd([[colorscheme nightfly]])
	end,
}
