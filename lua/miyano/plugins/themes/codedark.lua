--================================================================
-- codedark.lua
--================================================================
-- lua/miyano/plugins/themes/codedark.lua
-- created: 2023-09-09

return {
	"tomasiser/vim-code-dark",
	priority = 1000,
	lazy = false,
	name = "codedark",
	config = function()
		vim.cmd([[colorscheme codedark]])
	end,
}
