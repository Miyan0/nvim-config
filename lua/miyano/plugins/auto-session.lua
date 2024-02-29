--================================================================
-- auto-session.lua
--================================================================
-- lua/miyano/plugins/auto-session.lua
-- created: 2024-02-29

return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    })
  end,
}
