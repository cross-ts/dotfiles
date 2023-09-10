-- A file explorer tree for neovim written in lua
return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  cmd = { 'NvimTreeOpen' },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true

    require('nvim-tree').setup({
      renderer = {
        indent_markers = {
          enable = true,
        }
      }
    })
  end
}
