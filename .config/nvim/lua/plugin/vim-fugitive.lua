-- fugitive.vim: A Git wrapper so awesome, it should be illegal
return {
  'tpope/vim-fugitive',
  cmd = { 'Git' },
  init = function()
    vim.api.nvim_set_keymap('n', '<leader>git', ':Git', { noremap = true, silent = true })
  end,
}
