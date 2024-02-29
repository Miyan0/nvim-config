-- From luasnip doc https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#lua

-- As defining all of the snippet constructors (s, c, t, ...) in every file is rather
-- cumbersome, LuaSnip will bring some globals into scope for executing these files.
-- By default, the names from luasnip.config.snip_env will be used, but it's possible
-- to customize them by setting snip_env in setup.
--
-- These variable will be in scope:
-- https://github.com/L3MON4D3/LuaSnip/blob/master/lua/luasnip/config.lua#L22-L48

local ls = require("luasnip")
local fmta = require("luasnip.extras.fmt").fmta
local i = ls.insert_node
local r = require("luasnip.extras").rep
local s = ls.snippet

-- return {
-- 	s(
-- 		"hd",
-- 		fmta([[
-- --------------------------------------------------------------------------
-- -- TAG
-- --------------------------------------------------------------------------]]),
-- 		{}
-- 	),
-- }

return {
	s(
		{ name = "your name", trig = "trr" },
		fmta(
			[[
    println!("<NODE_1> = {:?}", <NODE_2>);
    ]],
			{
				NODE_1 = i(1, "NAME"),
				NODE_2 = r(1),
			}
		)
	),
}
