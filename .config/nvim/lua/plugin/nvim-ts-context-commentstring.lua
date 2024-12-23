-- Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.
return {
  'JoosepAlviste/nvim-ts-context-commentstring',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    enable_autocmd = false,
  },
}
