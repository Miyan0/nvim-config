local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- list here all plugins you want lazy to install
require("lazy").setup({
  { import = "miyano.plugins" },
  { import = "miyano.plugins.lsp" },
}, {
  -- install = {
  --   -- colorscheme = { "catppuccin" },
  --   colorscheme = { "aquarium" },
  -- },

  -- check for updates on startup, but don't notify us
  checker = {
    enabled = true,
    notify = false,
  },

  -- don't notify us about updates
  change_detection = {
    notify = false,
  },
})
