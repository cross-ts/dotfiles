-- enable the neon syntax highlighting as yaml
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.neon",
  callback = function()
    vim.bo.filetype = "yaml"
  end,
})
