-- autopairs for neovim written by lua
return {
  'windwp/nvim-autopairs',
  dependencies = {
    'nvim-treesitter/nvim-treesitter'
  },
  event = "InsertEnter",
  opts = {},
}
