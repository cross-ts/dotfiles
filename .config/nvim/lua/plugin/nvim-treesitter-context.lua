-- Show code context
return {
  'nvim-treesitter/nvim-treesitter-context',
  dependencies = {
    'nvim-treesitter/nvim-treesitter'
  },
  event = {
    'BufRead',
    'BufEnter',
  },
}
