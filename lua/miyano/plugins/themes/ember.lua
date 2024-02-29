--================================================================
-- ember.lua
--================================================================
-- lua/miyano/plugins/themes/ember.lua
-- created: 2023-09-09

return {
	"embark-theme/vim",
	priority = 1000,
	lazy = false,
	name = "embark",
	config = function()
		vim.cmd([[colorscheme embark]])
	end,
}
