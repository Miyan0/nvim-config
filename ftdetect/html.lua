vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.gohtml", "*.html", "*.tmpl" },
  callback = function()
    vim.opt_local.filetype = "html"
  end,
})
