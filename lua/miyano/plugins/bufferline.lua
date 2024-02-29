-- help ->:h bufferline-configuration
return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  diagnostics = "nvim_lsp",
  opts = { -- will call: require(bufferline).setup(opts)
    options = {
      mode = "buffers",
      separator_style = "thin",
      color_icons = true, -- whether or not to add the filetype icon highlights
      themable = true,
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "left",
          separator = false,
        },
      },
    },
  },
}
