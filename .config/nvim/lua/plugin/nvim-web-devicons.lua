-- lua `fork` of vim-web-devicons for neovim
return {
  'nvim-tree/nvim-web-devicons',
  lazy = true,
  config = function()
    require('nvim-web-devicons').setup({
      default = true,
      strict = true,
    })
  end,
}
