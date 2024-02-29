--================================================================
-- sourcekit.lua
--================================================================
-- lua/miyano/plugins/sourcekit.lua
-- created: 2023-10-22

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sourcekit = {
          cmd = {
            "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
          },
        },
      },
    },
  },
}
