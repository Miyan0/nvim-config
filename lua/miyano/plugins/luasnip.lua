--================================================================
-- luasnip.lua
--================================================================
-- lua/miyano/plugins/luasnip.lua
-- created: 2023-09-13
-- snippets

return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "2.*",
  dependencies = {
    "rafamadriz/friendly-snippets", -- useful snippets
  },
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
}
