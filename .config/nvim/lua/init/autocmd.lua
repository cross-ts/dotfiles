-- Remove trailing whitespace on save
do
  local group = 'Format'
  vim.api.nvim_create_augroup(group, {clear = true})
  vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    group = group,
    pattern = { '*' },
    command = [[%s/\s\+$//e]],
  })
end
