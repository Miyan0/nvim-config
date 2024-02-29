--================================================================
-- gopher.lua
--================================================================
-- lua/miyano/plugins/gopher.lua
-- created: 2023-09-13
-- go utils

return {
  "olexsmir/gopher.nvim",
  ft = "go",
  config = function(_, opts)
    require("gopher").setup(opts)
    require("miyano.configs.lsp-mappings").gopher()
  end,
  build = function()
    vim.cmd([[silent! GoInstallDeps]])
  end,
}
