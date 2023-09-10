-- A file explorer tree for neovim written in lua
return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  cmd = { 'NvimTreeOpen', "NvimTreeToggle" },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.api.nvim_set_keymap('n', '<leader>f', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
  end,
  config = function()
    require('nvim-tree').setup({
      renderer = {
        indent_markers = {
          enable = true,
        }
      }
    })
  end
}
