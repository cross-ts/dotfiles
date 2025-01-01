-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  event = {
    'VimEnter',
  },
  opts = {
    options = {
      disabled_filetypes = {
        statusline = {
          'no-neck-pain',
        },
        winbar = {
          'no-neck-pain',
        },
      },
    },
  },
}
