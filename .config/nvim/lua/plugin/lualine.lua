-- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
return {
  'nvim-lualine/lualine.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    options = {
      globalstatus = true,
    }
  }
}
