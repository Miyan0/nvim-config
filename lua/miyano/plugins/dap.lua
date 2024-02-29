--================================================================
-- dap.lua
--================================================================
-- lua/miyano/plugins/dap.lua
-- created: 2023-09-13
-- debugging

return {
  {
    "mfussenegger/nvim-dap",
  },

  -- go debugging
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("miyano.configs.lsp-mappings").dap()
      require("miyano.configs.lsp-mappings").dap_go()
    end,
  },
}
