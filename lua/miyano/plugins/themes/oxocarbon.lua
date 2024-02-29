--================================================================
-- oxocarbon.lua
--================================================================
-- lua/miyano/plugins/themes/oxocarbon.lua
-- created: 2023-09-09

return {
	"nyoom-engineering/oxocarbon.nvim",
	priority = 1000,
	lazy = false,
	name = "oxocarbon",
	config = function()
		vim.opt.background = "dark" -- set this to dark or light
		vim.cmd("colorscheme oxocarbon")
	end,
}
